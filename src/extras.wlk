import pepita.*
import wollok.game.*

object nido {
	method image() = "nido.png"
	method position() = game.at( game.width() - 2, game.height() - 2) //La cima del árbol
}

object silvestre { 
	var property position = game.origin()
	method image() = "silvestre.png"
}

