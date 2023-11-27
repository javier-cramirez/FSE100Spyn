brick.setColorMode(4, 2);

while 1
    brick.MoveMotor('AB', 35);
    touched = brick.TouchPressed(3);
    dist1 = brick.UltrasonicDist(1);
    dist2 = brick.UltrasonicDist(2);

    % On red, stop
    if color == 5
        disp('Me Stop');
        brick.StopMotor('AB', 'brake');
        pause(5);
    end

    % On green, key time
    if color == 3
        brick.StopMotor('AB');
        pause(1);
        run('keycontrol.m');
        pause(6);
    end

    % Ultrasonic1 looks left, if no left wall, turn
    if dist1 > 6
        brick.MoveMotor('AB', 15);
        pause(0.5);
        brick.MoveMotor('A', 90);
        brick.WaitForMotor('A');
        brick.MoveMotor('AB', 35);
        pause(2);
    end
    % Ultrasonic2 looks right, if no right wall, turn
    if dist2 > 6
        brick.MoveMotor('AB', 15);
        pause(0.5);
        brick.MoveMotor('A', 90);
        brick.WaitForMotor('A');
        brick.MoveMotor('AB', 35);
        pause(2);
    end
    % On wall touch, back up and 180
    if touched == 1
        brick.StopMotor('AB');
        pause(0.5);
        brick.MoveMotor('AB', -15);
        pause(0.5);
        brick.MoveMotor('A', 180);
        brick.WaitForMotor('A');
        brick.StopMotor('A');
        % If wall on left, turn right
        if dist1 < 6
            pause(0.5);
            brick.MoveMotor('B', 90);
            brick.WaitForMotor('B');
            brick.MoveMotor('AB', 30);
            pause(2);
        end
        % If wall on right, turn left
        if dist2 < 6
            pause(0.5);
            brick.MoveMotor('A', 90);
            brick.WaitForMotor('A');
            brick.MoveMotor('AB', 30);
            pause(2);
        else
            pause(0.5);
            brick.MoveMotor('AB', 30);
            pause(1);
        end
     end
end





    
