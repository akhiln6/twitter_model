class AddProfileImageToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :profile_image, :string
  end
end
