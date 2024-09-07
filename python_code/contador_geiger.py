import time

# Objetivo: Diseñar y desarrollar una clase en Python que represente un objeto con funcionalidad logica, aplicando TDD, conceptos POO.
# Tematica de clase a diseñar: Contador Geiger.


class ContadorGeiger:
    def __init__(self, sensibilidad: int = 1):
        self.encendido = False
        self.contador = 0
        self.sensibilidad = sensibilidad
        self.alarma = False
        # Nivel de radiación minima para hacer sonar la alarma.
        self.min_alarma = 100

    def encender(self):
        # Luego de 3 segundos de carga, se enciende el contador correctamente.
        time.sleep(3)
        self.encendido = True
        if not self.encendido:  # Si no es True, se lanza la siguiente excepción.
            raise ValueError(
                "El contador no se ha encendido como se esperaba.")
        else:
            return "Contador encendido con normalidad."

    def apagar(self):
        self.encendido = False
        # Si es true (no se apago con exito), se lanza la excepción.
        if self.encendido:
            raise ValueError("El contador no se ha apagado.")
        else:
            return "Contador apagado con exito."

    # Se crea un metodo para detectar la radiación, simulando un nivel de radiación especificado en el atributo.
    def detectar_radiacion(self, nivel_radiacion: int):
        if not self.encendido:
            raise ValueError(
                "No se puede detectar niveles de radiación con el dispositivo apagado.")
        if nivel_radiacion < 1:
            # Validación de que el numero pasado como atributo no sea menor a 1.
            raise ValueError(
                "Pasar como parametro un numero igual o mayor a 1.")
        if self.encendido and nivel_radiacion >= 1:
            self.contador = nivel_radiacion
            return self.contador

    # Metodo para generar-prender una alarma, al llegar al tope minimo de activación por nivel de radiación.
    def generar_alarma(self):
        if not self.encendido:
            raise ValueError(
                "La alarma no se configurara ni se activara si el dispositivo no se encuentra encendido.")
        if self.contador >= self.min_alarma:
            self.alarma = True
            return self.alarma
        else:
            return self.alarma

    # Get, para obtener los atributos del objeto.
    def __str__(self):
        return f"El contador geiger se encuentra {self.encendido}. Su nivel de senbilidad por defecto es de {self.sensibilidad}. Para activarse la alarma de peligro, la radiación debe llegar a un nivel igual o mayor a {self.min_alarma}. El nivel de radiación actual es de {self.contador}."
# Finaliza la clase ContadorGeiger


# Generamos una instancia para probar los metodos de la clase.
c_geiger = ContadorGeiger()
c_geiger.encender()
c_geiger.detectar_radiacion(105)
c_geiger.generar_alarma()
print(c_geiger)
