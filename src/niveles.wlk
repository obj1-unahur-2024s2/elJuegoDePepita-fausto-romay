import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
		config.configurarTeclas()
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
		keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1))})
		keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1))})
		
		//Configuracion tecla C.
		keyboard.c().onPressDo({
			if (pepita.position() == manzana.position()) {
				pepita.come(manzana)
                game.removeVisual(manzana)
			} else if (pepita.position() == alpiste.position()) {
				pepita.come(alpiste)
                game.removeVisual(alpiste)
			}
		})
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { manzana => manzana.estaPepita()})
		game.onCollideDo(pepita, { alpiste => alpiste.estaPepita()})
	}

}

