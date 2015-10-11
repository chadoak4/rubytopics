class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :review

  has_attached_file :topic_img, styles: {:topic_show => "700x1100>" }, :scale => 0.75, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :topic_img, content_type: /\Aimage\/.*\Z/
end
