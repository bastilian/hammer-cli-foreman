module HammerCLIForeman
  class SSHKeys < HammerCLIForeman::Command
    resource :ssh_keys
    command_name "ssh-keys"
    desc _("Manage SSH Keys sources.")

    class ListCommand < HammerCLIForeman::ListCommand
      output do
        field :id, _("Id")
        field :name, _("Name")
        field :fingerprint, _("Fingerprint")
        field :length, _("Length")
        field :created_at, _("Created at"), Fields::Date
      end

      build_options
    end

    class CreateCommand < HammerCLIForeman::CreateCommand
      command_name "add"

      success_message _("SSH Key %{name} added")
      failure_message _("Could not add SSH Key")

      build_options
    end

    class DeleteCommand < HammerCLIForeman::DeleteCommand
      success_message _("SSH Key deleted")
      failure_message _("Could not delete the SSH Key")

      build_options
    end

    autoload_subcommands
  end
end
