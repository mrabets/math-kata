class AddSuperadmin < ActiveRecord::Migration[6.1]
  def change
    User.create! do |u|
        u.email     = 'newrabgo@gmail.com'
        u.password  = 'password'
        u.superadmin_role = true
    end
  end
end
