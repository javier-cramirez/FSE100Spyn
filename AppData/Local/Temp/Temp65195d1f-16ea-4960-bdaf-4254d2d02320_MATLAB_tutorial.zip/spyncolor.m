try
    brick.setColor(1, 2);
    brick.ColorCode(2);
    brick.MoveMotor('AB', 50);
    
    if (color == 5)
        brick.StopMotor('AB');
        brick.beep();
    end
    if (color == 2)
        brick.StopMotor('AB');
        brick.beep();
        brick.beep();
    end
    if (color == 3)
        brick.StopMotor('AB');
        brick.beep();
        brick.beep();
        brick.beep();
    end
catch
    brick.beep();
    brick.StopMotor('AB');
    brick.beep();
end