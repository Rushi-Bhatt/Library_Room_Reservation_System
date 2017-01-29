LibraryApp::Application.routes.draw do



  root "access#login"
  match ':controller(/:action(/:id))',:via => [:get,:post]

  end
