require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.find_by_title(title)
    plays = PlayDBConnection.instance.execute("SELECT * FROM plays WHERE title = '#{title}'")
    plays.map {|play| Play.new(play)}
  end

  def self.find_by_playwright(name)

    playwrights = PlayDBConnection.instance.execute(<<-SQL , name) SELECT * FROM playwrights WHERE name = ? 
    SQL
    playwrights = playwrights.map {|playwright| Playwright.new(playwright)}
    plays = PlayDBConnection.instance.execute("SELECT * FROM plays WHERE playwright_id = '#{id}'")
  end

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright
  attr_accessor :id, :name, :birth_year

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights WHERE name = '#{name}'")
    data.map { |datum| Playwright.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['name']
    @year = options['birth_year']
  end


  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
      INSERT INTO
        playwrights (name, birth_year)
      VALUES
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end
end

p Play.find_by_title("All My Sons")
p Play.find_by_playwright("Arthur Miller")

p Playwright.find_by_name('Arthur Miller')