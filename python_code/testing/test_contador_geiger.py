# Agregar la ruta del directorio padre al sys.path
import sys
import os
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
from contador_geiger import ContadorGeiger


# Testing del funcionamiento de la clase ContadorGeiger.

# Verifico que al usar el metodo "encender()", el valor del atributo de la instancia "encendido" cambie a True. Y luego verifico que el return del metodo almacenado en "resultado" sea el string esperado. 
def test_encender():
    c_geiger = ContadorGeiger() 
    resultado = c_geiger.encender() # Se almacena el return en resultado, entonces luego hago un assert para verificar si se retorna lo esperado.
    assert c_geiger.encendido is True
    assert resultado == "Contador encendido con normalidad."

# Lo mismo que test_encender pero lo contrario.
def test_apagar():
    c_geiger = ContadorGeiger()
    resultado = c_geiger.apagar()
    assert c_geiger.encendido is False 
    assert resultado == "Contador apagado con exito."

#Verifico que si al querer detectar una radiación, el dispositivo se encuentra apagado(False), se lanze una excepción. Luego verifico que una vez detectado una radiación, el nivel del contador coincida con el nivel de la radiación. 
def test_detectar_radiacion():
    c_geiger = ContadorGeiger()
    #Prueba con el dispositivo apagado.
    try:
        c_geiger.detectar_radiacion(50)
        assert False, "Se esperaba una excepción cuando el disposito se encuentre apagado" #Si no hay excepción en el metodo original, envio un assert False para fallar la prueba ya que espero una excepcion.
    except ValueError as error: # Cuando se lanza la excepción, se captura y luego en el assert comparo que el valor de la excepción sea igual al esperado en el metodo testeado.
        assert str(error) == "No se puede detectar niveles de radiación con el dispositivo apagado." 
        
    #Prueba con el dispositivo encendido. 
    c_geiger.encender() 
    nivel_radiacion = c_geiger.detectar_radiacion(50) #El return se almacena en la variable. En este caso, 50 como numero entero.
    assert nivel_radiacion == c_geiger.contador # Contador tiene que valer 50.

# Verificar funcionamiento de la alarma. Si se activa cuando corresponde.
def test_generar_alarma():
    c_geiger = ContadorGeiger()
    c_geiger.encender()
    c_geiger.detectar_radiacion(50)
    alarma = c_geiger.generar_alarma()
    assert alarma is False
    c_geiger.detectar_radiacion(100)
    alarma = c_geiger.generar_alarma()
    assert alarma is True
    
