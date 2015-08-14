require 'spec_helper'

RSpec.describe App do
  describe "GET /" do
    it "should say hello" do
      get '/'
      expect(last_response.body).to eq("hello")
    end
  end

  describe "/events" do
    describe "POST /events" do
      it "should create a new event" do
        post '/events'
        expect(last_response.body).to eq("new event")
      end
    end

    describe "GET /events" do
      it "should get all of the events" do
        get '/events'
        expect(last_response.body).to eq("all events")
      end
    end

    describe "GET /events/:id" do
      it "should pass the id" do
        get '/events/1234'
        expect(last_response.body).to eq("get 1234")
      end
    end
  end

  describe "registration branch" do
    describe "/events/:event_id/registrations" do
      it "should get the registrations" do
        get '/events/1234/registrations'
        expect(last_response.body).to eq("all of the event's 1234 registrations")
      end
    end

    describe "/events/:event_id/registrations/:registration_id" do
      it "should get the registration" do
        get '/events/1234/registrations/5678'
        expect(last_response.body).to eq("registration 5678")
      end
    end

    describe "session_registrations branch" do
      describe "/events/:event_id/registraitons/:registration_id/session_registrations" do
        it "should get the registration's sessions" do
          get '/events/1234/registrations/5678/session_registrations'
          expect(last_response.body).to eq("all of registration's 5678 sessions")
        end
      end
    end

    describe "session_registrations branch" do
      describe "/events/:event_id/registraitons/:registration_id/ticket_registrations" do
        it "should get the registration's tickets" do
          get '/events/1234/registrations/5678/ticket_registrations'
          expect(last_response.body).to eq("all of registration's 5678 tickets")
        end
      end
    end
  end

  describe "sessions branch" do
    describe "/events/:event_id/sessions" do
      it "should get the sessions" do
        get '/events/1234/sessions'
        expect(last_response.body).to eq("all of the event's 1234 sessions")
      end
    end

    describe "/events/:event_id/sessions/:session_id" do
      it "should get the session" do
        get '/events/1234/sessions/5678'
        expect(last_response.body).to eq("session 5678")
      end
    end
  end

  describe "tickets branch" do
    describe "/events/:event_id/tickets" do
      it "should get the tickets" do
        get '/events/1234/tickets'
        expect(last_response.body).to eq("all of the event's 1234 tickets")
      end
    end

    describe "/events/:event_id/tickets/:ticket_id" do
      it "should get the ticket" do
        get '/events/1234/tickets/5678'
        expect(last_response.body).to eq("ticket 5678")
      end
    end
  end
end
