class Museum
  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    patron.interests.map do |interest|
      @exhibits.find_all do |exhibit|
        exhibit.name == interest
      end
    end.flatten
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit = {}
    @exhibits.each do |exhibit|
      @patrons.each do |patron|
        if patrons_by_exhibit[exhibit].nil? && patron.interests.include?(exhibit.name)
          patrons_by_exhibit[exhibit] = [patron]
        elsif patron.interests.include?(exhibit.name)
          patrons_by_exhibit[exhibit] << patron
        end
        patrons_by_exhibit[exhibit] = [] if patrons_by_exhibit[exhibit].nil?
      end
    end
    patrons_by_exhibit
  end
end
