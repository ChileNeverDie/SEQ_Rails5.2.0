class Problem < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) } 
  validates :user_id, presence: true 
  validates :productid, presence: true
  validates :productname, presence: true
  validates :lob, presence: true, inclusion: {in:['Component','BL'],message:'Must be "Component" or "BL"'} 
  validates :description, presence:true, length: {maximum: 500}
  validates :status, presence: true, inclusion: {in:['Open','Close'],message:'Please input Open or Close'} 
  validates :supplier, presence: true


#   # 返回调整尺寸后的图像，供显示                            
#   def display_image 
#     image.variant(resize_to_limit: [500, 500])
#   end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |problem|
        csv << problem.attributes.values_at(*column_names)
      end
    end
  end

end