module Api::ApiResponder
  include ActionView::Helpers::NumberHelper

  attr_reader :model

  def self.included(klass)
    klass.extend ClassMethods
  end

  def initialize(model)
    @model = model
  end

  def json_time(time)
    time ? I18n.l(time.utc, format: :json) : nil
  end

  def json_date(date)
    date ? I18n.l(date, format: :json) : nil
  end

  def to_currency(amount)
    number_to_currency(amount)
  end

  module ClassMethods

    # Pass in a scope and it will iterate over the models and call to_hash on
    # each one. Or just pass in a model and it will call to_hash on that. For a
    # scope, it will try to guess the hash key to use based on the model you
    # are hashing, but you can explicitly pass in the list_name if you want.
    #
    # E.g.
    #
    # to_hash(foo) =>
    # { name: 'Rapala' }
    #
    # to_hash(Foo.all) =>
    # { foos: [{ name: 'Rapala'}, { name: 'Williamson' }] }
    #
    # to_hash(Foo.all, list_name: 'bars') =>
    # { bars: [{ name: 'Rapala'}, { name: 'Williamson' }] }
    #
    def to_hash(scope_or_model, list_name: nil)
      if scope_or_model.respond_to?(:scoping)
        list_name ||= list_name(scope_or_model)
        { list_name => list(scope_or_model) }
      else
        new(scope_or_model).to_hash
      end
    end

    # E.g. list_name(User.all) => "users"
    def list_name(scope)
      scope.new.class.name.tableize
    end

    def list(scope)
      scope.map { |model| new(model).to_hash }
    end
  end
end
