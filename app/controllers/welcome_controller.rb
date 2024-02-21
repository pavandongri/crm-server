class WelcomeController < ApplicationController
    def index
        render html: "<h1>Welcome to CRM developed by Pavan</h1>".html_safe
    end
end
