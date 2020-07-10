<%- if devise_mapping.recoverable? && controller_name != 'passwords' && controller_name != 'registrations' %>
  <%= link_to "Forgot your password?", new_password_path(resource_name) %><br />
<% end %>

<%- if devise_mapping.confirmable? && controller_name != 'confirmations' %>
  <%= link_to "Didn't receive confirmation instructions?", new_confirmation_path(resource_name) %><br />
<% end %>

<%- if devise_mapping.lockable? && resource_class.unlock_strategy_enabled?(:email) && controller_name != 'unlocks' %>
  <%= link_to "Didn't receive unlock instructions?", new_unlock_path(resource_name) %><br />
<% end %>

^^ for sign up page

  <% if devise_mapping.rememberable? %>
    <div class="field">
      <%= f.check_box :remember_me %>
      <%= f.label :remember_me %>
    </div>
  <% end %>


^^ for Log in page









<%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
  <h1 class="h3 mb-3 font-weight-normal">Log In</h1>
  <div class="field">
    <%= f.label :email, class:"sr-only"%><br />
    <%= f.email_field :email, autofocus: true, autocomplete: "email", class:"form-control" %>
  </div>

  <div class="field">
    <%= f.label :password, class:"sr-only" %><br />
    <%= f.password_field :password, autocomplete: "current-password", class:"form-control" %>
  </div>

  <% if devise_mapping.rememberable? %>
    <div class="field">
      <%= f.check_box :remember_me %>
      <%= f.label :remember_me %>
    </div>
  <% end %>

  <div class="actions">
    <%= f.submit "Log in", class: "btn btn-lg btn-primary btn-block" %>
  </div>
<% end %>

<%= render "devise/shared/links" %>





