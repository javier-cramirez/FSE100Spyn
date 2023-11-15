try
    brick.SetColorMode(1, 1);
    color = brick.ColorCode(1);
    dist = brick.UltrasonicDist(2);

    brick.MoveMotor('AB', 50);

    if ((color == 2) || (color == 5))
        brick.beep();
        display(color);
        brick.stopMotor('AB', 'Coast');
    end
    
    if color == 4
        brick.beep();
        brick.MoveMotorAngleAbs('A', 50, 90, 'Coast');
        brick.WaitForMotor();
        brick.MoveMotor('AB', 50);
        if dist < 1
            brick.beep();
            brick.MoveMotorAngleAbs('A', 50, 180, 'Coast');
            brick.WaitForMotor();
            brick.MoveMotor('AB', 50);
            color = brick.ColorCode(1);
        end
    end 
catch
    brick.beep();
    brick.beep();
    brick.StopMotor('AB');
end
