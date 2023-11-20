brick.SetColorMode(1,1);

while 1
    color = brick.ColorCode(1);
    dist = brick.UltrasonicDist(2);
    touch = brick.TouchPressed(3);

    brick.MoveMotor('AB', 50);

    if color == 5
        disp('red');
        brick.StopMotor('AB', 'Brake');
        pause(3);
        brick.beep();
    end
    if ((color == 3) || (color == 4))
        brick.pause(3);
        brick.beep();
        disp(color);
    end
    if dist < 1
        pause(0.5);
        brick.beep();
        brick.StopMotor('AB', 'Brake');
        brick.MoveMotor('AB', -40);
        pause(2.3);
        brick.MoveMotorAngleAbs('A', 50, 180, 'Coast');
        brick.WaitForMotor('A');
        brick.MoveMotor('AB', 50);
        pause(2);
    end
        
    if ((dist < 3)&& (dist > 1))
            brick.beep();
            brick.MoveMotorAngleAbs('A', 50, -90, 'Coast');
            brick.WaitForMotor('A');
            brick.MoveMotor('AB', 50);

    end
    
    if dist < 0.5
        pause(0.8);
        brick.MoveMotor('AB', -40)
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