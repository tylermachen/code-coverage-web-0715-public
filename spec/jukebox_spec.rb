# Use this song data for your tests
songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]

describe Song do
  it 'has a name' do
    song = Song.new('song_name')
    expect(song.name).to eq("song_name")
  end
end

describe Jukebox do
  it 'has songs' do
    jukebox = Jukebox.new(songs)
    expect(jukebox.songs).to eq(songs = [
      "The Phoenix - 1901",
      "Tokyo Police Club - Wait Up",
      "Sufjan Stevens - Too Much",
      "The Naked and the Famous - Young Blood",
      "(Far From) Home - Tiga",
      "The Cults - Abducted",
      "The Phoenix - Consolation Prizes"
    ])
  end

  it 'has an on button' do
    jukebox = Jukebox.new(songs)
    expect(jukebox.on?).to eq(true)
  end

  it 'accepts play command' do
    jukebox = Jukebox.new(songs)
    expect(jukebox.command('play The Phoenix - 1901')).to eq("now playing The Phoenix - 1901")
  end

  it 'accepts valid commands' do
    jukebox = Jukebox.new(songs)
    expect(jukebox.command('help')).to eq("Please select help, list, exit, or play.")
  end

  it 'denies an invalid command' do
    jukebox = Jukebox.new(songs)
    expect(jukebox.command('ndiaufgaiuf')).to eq('invalid command')
  end

  it 'has a help method' do
    jukebox = Jukebox.new(songs)
    expect(jukebox.help).to eq("Please select help, list, exit, or play.")
  end

  it 'displays a list of songs' do
    jukebox = Jukebox.new(songs)
    list = "1 The Phoenix - 1901\n2 Tokyo Police Club - Wait " +
    "Up\n3 Sufjan Stevens - Too Much\n4 The Naked and the Famous - " +
    "Young Blood\n5 (Far From) Home - Tiga\n6 The Cults - Abducted\n" +
    "7 The Phoenix - Consolation Prizes\n"
    expect(jukebox.list).to eq(list)
  end

  it 'plays songs' do
    jukebox = Jukebox.new(songs)
    song_request = "The Phoenix - 1901"
    expect(jukebox.play(song_request)).to eq("now playing #{song_request}")
  end

  it 'has an exit method' do
    jukebox = Jukebox.new(songs)
    expect(jukebox.exit).to eq("Goodbye, thanks for listening!")
    expect(jukebox.on?).to eq(false)
  end
end
