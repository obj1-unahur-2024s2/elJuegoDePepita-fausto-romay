import extras.*
import niveles.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0,2)
	var property seguidor = silvestre  

	method image() {
		return if (self.estaEnElNido()) {
			"pepita-grande.png"
		} else if (self.estaAtrapada() or self.energia() < 9) {
			"pepita-gris.png"
		} else {
			"pepita.png"
		}
	}

	method estaAtrapada() {
		return self.position() == seguidor.position()
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
    	if (not self.estaCansada()) {
        	if (nuevaPosicion.x() >= 0 and nuevaPosicion.x() < game.width() and 
            	nuevaPosicion.y() >= 0 and nuevaPosicion.y() < game.height()) {
            	self.vola(position.distance(nuevaPosicion))
            	position = nuevaPosicion
            	seguidor.position(game.at(position.x(), seguidor.position().y()))
            	game.say(self, self.suEnergia())
            	energia = energia - 9
        	} else {
            	game.say(self, "¡No puedes salir del tablero!")
        	}
    	} else {
        	game.say(self, "GAME OVER")
    	}
	}


	method suEnergia() {
		return "Energia actual: " + energia
	}

	method estaCansada() {
		return energia <= 8
	}

	method estaEnElNido() {
		return self.position() == nido.position() 
	}
}

