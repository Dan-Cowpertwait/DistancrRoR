<%- if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations' %>
  <%= link_to "Forgot your password?", new_password_path(resource_name) %><br />
<% end %>

<%- if devise_mapping.confirmable? && controller_name != 'confirmations' %>
  <%= link_to "Didn't receive confirmation instructions?", new_confirmation_path(resource_name) %><br />
<% end %>

<%- if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks' %>
  <%= link_to "Didn't receive unlock instructions?", new_unlock_path(resource_name) %><br />
<% end %>


for model:

:recoverable,

<!DOCTYPE html>
<html>
  <head>
    <title>DistancrRoR</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
  <%= render 'layouts/devisealerts' %>
  <%= yield %>
  </body>
</html>