ActiveAdmin.register Feedback do

    permit_params :name, :email, :content
  
    index do
      selectable_column
      id_column
      column :name
      column :email
      column :content
      actions
    end
  
    filter :name
    filter :email
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :email
        f.input :content
      end
      f.actions
    end

  
  
end
