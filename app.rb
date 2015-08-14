require 'roda'
class App < Roda

  # /events
  # /events/:event_id
  # /events/:event_id/tickets
  # /events/:event_id/tickets/:ticket_id
  # /events/:event_id/sessions
  # /events/:event_id/sessions/:session_id
  # /events/:event_id/registrations/:registration_id
  # /events/:event_id/registrations/:registration_id/session_registrations
  # /events/:event_id/registrations/:registration_id/session_registrations/:session_registration_id
  # /events/:event_id/registrations/:registration_id/ticket_registrations
  # /events/:event_id/registrations/:registration_id/ticket_registrations/:ticket_registration_id

  route do |r|
    # GET /
    r.root do
      "hello"
    end

    # /events
    r.on "events" do

      # /events/:event_id
      r.on ":event_id" do |event_id|

        # /events/:event_id/registrations
        r.on "registrations" do

          # /events/:event_id/registrations/:registration_id
          r.on ":registration_id" do |registration_id|

            # /events/:event_id/registration/:registration_id/session_registrations
            r.on "session_registrations" do
              r.get do
                "all of registration's #{registration_id} sessions"
              end
            end

            # /events/:event_id/registration/:registration_id/ticket_registrations
            r.on "ticket_registrations" do
              r.get do
                "all of registration's #{registration_id} tickets"
              end
            end

            r.get do
              "registration #{registration_id}"
            end
          end

          r.get do
            "all of the event's #{event_id} registrations"
          end
        end

        # /events/:event_id/sessions
        r.on "sessions" do

          # /events/:event_id/sessions/:session_id
          r.on ":session_id" do |session_id|
            r.get do
              "session #{session_id}"
            end
          end

          r.get do
            "all of the event's #{event_id} sessions"
          end
        end

        # /events/:event_id/tickets
        r.on "tickets" do

          # /events/:event_id/tickets/:ticket_id
          r.on ":ticket_id" do |ticket_id|
            r.get do
              "ticket #{ticket_id}"
            end
          end

          r.get do
            "all of the event's #{event_id} tickets"
          end
        end

        r.get do
          "get #{event_id}"
        end
      end

      r.get do
        "all events"
      end

      r.post do
        "new event"
      end
    end
  end
end
