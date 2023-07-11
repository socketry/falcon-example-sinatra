#!/usr/bin/env falcon-host
# frozen_string_literal: true

load :rack, :supervisor

supervisor

rack 'example.localhost' do
	scheme 'http'
	protocol {Async::HTTP::Protocol::HTTP1}
	endpoint do
		Async::HTTP::Endpoint.for(scheme, "localhost", port: 9292, protocol: protocol)
	end
	
	append preload "preload.rb"
end
