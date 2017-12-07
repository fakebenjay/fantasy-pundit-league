class PositionPlayer {
  constructor(name, team, position, status, opp, week, compAtt, passYds, passTD, int, rushAtt, rushYds, rushTD, rec, recYds, recTD, tar, twoPC, fuml, miscTD, points) {
    this.name = name
    this.team = team
    this.position = position
    this.status = status
    this.opp = opp
    this.week = week
    this.compAtt = compAtt
    this.passYds = passYds
    this.passTD = passTD
    this.int = int
    this.rushAtt = rushAtt
    this.rushYds = rushYds
    this.rushTD = rushTD
    this.rec = rec
    this.recYds = recYds
    this.recTD = recTD
    this.tar = tar
    this.twoPC = twoPC
    this.fuml = fuml
    this.miscTD = miscTD
    this.points = points
  }

  static modelize(player) {
    return new PositionPlayer(
      player.name,
      player.team,
      player.position,
      player.status,
      player.opp,
      player.week,
      player.compAtt,
      player.passYds,
      player.passTD,
      player.int,
      player.rushAtt,
      player.rushYds,
      player.rushTD,
      player.rec,
      player.recYds,
      player.recTD,
      player.tar,
      player.twoPC,
      player.fuml,
      player.miscTD,
      player.points
    )
  }
}

class Defense {
  constructor(objectId, ssid, location, city, boro, locationType, type, latitude, longitude, name, provider, distance) {
    this.name = name
    this.position = position
    this.status = status
    this.opp = opp
    this.week = week
    this.td = td
    this.int = int
    this.fr = fr
    this.sck = sck
    this.sfty = sfty
    this.blk = blk
    this.pa = pa
    this.points = points
  }
}

class Kicker {
  constructor(objectId, ssid, location, city, boro, locationType, type, latitude, longitude, name, provider, distance) {
    this.name = name
    this.team = team
    this.position = position
    this.status = status
    this.opp = opp
    this.week = week
    this.thirty = thirty
    this.forty = forty
    this.fifty = fifty
    this.fg = fg
    this.xp = xp
    this.points = points
  }
}
