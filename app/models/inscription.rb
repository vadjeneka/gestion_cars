class Inscription < ApplicationRecord
  validates :prenom, 
            :nom,
            :montant,
            :matricule,
            :mois,
            :num_parent,
            :destination,
            :classe ,presence: true
  
  has_one_attached :qr_code
  after_create :generate
  # include Rails.application.routes.url_helpers
  # require 'rqrcode'

  def generate
    generate_qr_code(self)
  end

  def generate_qr_code(user)
    qrcode_content = (user.id).to_s
    qrcode = RQRCode::QRCode.new(qrcode_content)
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
    unless user.qr_code.attached? 
      image_name = user.id
      IO.binwrite("app/assets/images/#{image_name}.png", png.to_s)
      blob = ActiveStorage::Blob.create_after_upload!(
        io: File.open("app/assets/images/#{image_name}.png"),
        filename: image_name,
        content_type: 'png'
      )
      user.qr_code.attach(blob)
    end
  end
end
