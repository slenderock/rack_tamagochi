# frozen_string_literal: true

ROUTES = {
  { request: 'GET',  path: '/api/v1/'     } => { controller: :pets_controller, action: :new  },
  { request: 'POST', path: '/api/v1/feed' } => { controller: :pets_controller, action: :feed },
  { request: 'POST', path: '/api/v1/play' } => { controller: :pets_controller, action: :play },
  { request: 'POST', path: '/api/v1/rest' } => { controller: :pets_controller, action: :rest },
  not_found: { controller: :errors_controller, action: :not_found }
}.freeze
