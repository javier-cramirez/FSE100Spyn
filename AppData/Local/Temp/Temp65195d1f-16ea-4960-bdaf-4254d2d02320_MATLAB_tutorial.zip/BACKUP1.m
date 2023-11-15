while True
    brick.SetColorMode(1,1);
    color = brick.ColorCode(1);
    dist = brick.UltrasonicDist(2);

    threshold = 50;

    brick.MoveMotor('AB', 50);

    if ((color == 2) || (color == 5)) 
        brick.pause(3);
        brick.beep();
        display(color);
    end
    if ((color == 3) || (color == 4))
        brick.pause(3);
        brick.beep();
        display(color);
    end
    if dist < 1
        brick.beep();
        brick.MoveMotorAngleAbs('A', 50, 180, 'Coast');
        brick.WaitForMotor('A');
        brick.MoveMotor('AB', 50);
        
        if dist < 3
            brick.beep();
            brick.MoveMotorAngleAbs('A', 50, -90, 'Coast');
            brick.WaitForMotor('A');
            brick.MoveMotor('AB', 50);
        
        else
            brick.pause(2);
            brick.beep();
            brick.MoveMotorAngleAbs('A', 50, 90, 'Coast');
            brick.WaitForMotor('A');
            brick.MoveMotor('AB', 50);
            if dist < 1
                brick.MoveMotor('AB', -10);
                brick.pause(1);
                brick.MoveMotorAngleRel('A', 50, 20, "Coast");
                brick.WaitForMotor('A');
                brick.MoveMotor('AB', 50);
                brick.pause(2);
                brick.StopMotor('AB');
            end
        end

    end
    
    if dist > threshold
        pause(0.8);
        brick.MoveMotor('AB', -10)
        brick.WaitForMotor('AB');
        pause(0.2);
        brick.MoveMotorAngleAbs('A', 30, -90);
        brick.WaitForMotor('A');
        brick.MoveMotor('AB', 30);
        if dist < 2
            brick.StopMotor('AB');
            brick.MoveMotor('AB', -20);
            pause(0.6);
            brick.MoveMotorAngleAbs('A', 30, 180);
            brick.WaitForMotor('A');
            brick.MoveMotor('AB', 50);
            if dist < 2
                brick.beep();
            end
        end
    end

end