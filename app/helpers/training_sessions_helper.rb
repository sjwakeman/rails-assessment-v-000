module TrainingSessionsHelper
    def client_id_field(training_session)
      if training_session.client.nil?
        select_tag "training_session[client_id]", options_from_collection_for_select(Client.all, :id, :name)
      else
        hidden_field_tag "training_session[client_id]", training_session.client_id
      end
    end
  end