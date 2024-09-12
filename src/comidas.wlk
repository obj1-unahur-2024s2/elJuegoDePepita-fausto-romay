import wollok.game.*

object manzana {
	var property energiaQueOtorga = 80
	var property position = self.mover()
	method image() = "manzana.png"
	method estaPepita() = game.say(self, "Manzana: " + energiaQueOtorga + " energy")

	method mover() {
		const x = (0.. game.width()-1).anyOne()
		const y = (0.. game.height()-1).anyOne()
		position = game.at(x,y)
		return position
	}

	method teEncontro(objecto) {
		objecto.come(self.energiaQueOtorga())
	}
}

object alpiste {
	var property energiaQueOtorga = 50
	var property position = game.at(4,5)
	method image() = "alpiste.png"
	method estaPepita() = game.say(self, "Alpiste: " + energiaQueOtorga + " energy")

	method teEncontro(objecto) {
		objecto.come(self.energiaQueOtorga())
	}
}

