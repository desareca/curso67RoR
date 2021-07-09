def adivina_numero valor
    number = 25
    # El usuario envía el valor correcto, devuelve "¡Lo conseguiste!".
    # El usuario envía un número más alto, devuelve "¡La suposición fue demasiado alta!".
    # El usuario envía un número más bajo, devuelve "¡La suposición fue demasiado baja!".
    unless !(valor == number)
        puts "valor: #{valor}. Resp: ¡Lo conseguiste!"
    else
        unless !(valor > number)
            puts "valor: #{valor}. Resp: ¡La suposición fue demasiado alta!"
        else
            puts "valor: #{valor}. Resp: ¡La suposición fue demasiado baja!"
        end
    end
end 

adivina_numero 23
adivina_numero 25
adivina_numero 27
