RailsAdmin.config do |config|
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)
  config.excluded_models = ["ActiveStorage::Blob", "ActiveStorage::Attachment", "Admin"]

  config.model User do
    include_fields :name, :phone_number, :address, :email, :password,
      :password_confirmation
  end

  config.model ChatRoom do
    field :name
    field :match_id, :enum do
      enum do
        Match.all.collect {|match| [match.name, match.id]}
      end
    end
  end

  config.model League do
    field :name
  end

  config.model Message do
    include_fields :message, :user_id, :chat_room_id
  end

  config.model Match do
    include_fields :name, :league, :start_time, :end_time, :information
    field :team_id_1, :enum do
      enum do
        Team.all.collect {|team| [team.name, team.id]}
      end
    end
    field :team_id_2, :enum do
      enum do
        Team.all.collect {|team| [team.name, team.id]}
      end
    end
  end

  config.model TimeGoal do
    include_fields :match, :time_goal, :team
  end

  config.model Team do
    field :name
  end

  config.actions do
    dashboard
    index
    new do
      except Message
    end
    export do
      except ["ChatRoom", "Message"]
    end
    bulk_delete do
      except User
    end
    show
    edit do
      except ["User", "Message"]
    end
    delete do
      except User
    end
  end
end
