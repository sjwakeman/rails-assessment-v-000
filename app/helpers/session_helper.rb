module SessionHelper    
    def user_id_field(training_session)
        <% if session[:user_id] %>
            <h1><%= @user.name %></h1>
            <h2>Email: <%= @user.email %></h2>
            <h2>Facebook UID: <%= @user.uid %></h2>
            <img src="<%= @user.image %>">
        <% else %>
            <%= link_to('Log in with Facebook!', '/auth/facebook') %>
        <% end %>
    <% end %>    
<% end %>