% FIGURE OUT WHICH MOTORS T TURN AND HOW LONG
brick.SetColorMode(4, 2);

while 1
    dist = brick.UltrasonicDist(1);
    touched = brick.TouchPressed(2);
    color = brick.ColorCode(4);
    count = 0;

    % START
    % TURN LEFT
    brick.MoveMotor('AB', 80);

    if (color == 4 || color == 2 || color == 3 && color ~= 1 && color ~=0)
        brick.beep();
        brick.StopMotor('AB');
        run('keycontrol.m');
        % BEFORE ENDING KEY, ORIENT MOTOR PROPERLY
        pause(3);
    end

    brick.MoveMotor('AB', 80);
    
    if (touched && count < 3)
        brick.StopMotor('AB');
        brick.MoveMotor('AB', -70);
        pause(1);
        brick.StopMotor('AB');
        brick.MoveMotorAngleRel('B', 60, 150);
        brick.WaitForMotor('B');

        brick.MoveMotor('AB', 80); 
        count = count+1;
    end

    if count == 3
        brick.StopMotor('AB');
        brick.MoveMotor('AB', -70);
        pause(1);
        brick.MoveMotorAngleRel('A', 60, 150);
        brick.WaitForMotor('A');
        brick.MoveMotor('AB', 80);
        count = count+1;
    end

    if count == 4
        brick.StopMotor('AB');
        brick.MoveMotor('AB', -70);
        pause(1);
        brick.MoveMotorAngleRel('A', 60, 150);
        brick.WaitForMotor('A');
        brick.MoveMotor('AB', 80);
        count = count+1;
    end

    % MANUAL CONTROL
    

    % LEAVING YELLER
    brick.MoveMotor('AB', 80);

    % HOW TO LEAVE?
    % WHEN WE REACH LAST WALL OUT, TURN LEFT
    if dist < 4
        pause(3);
        brick.MoveMotorAngleRel('B', 55, 90);
        brick.WaitForMotor('B');
        % MOVE FORWARD UNTIL GREEN
        brick.MoveMotor('AB', 55);
    end

    % IF WALL NOT THERE, TURN
    if dist > 4
        pause(1);
        brick.MoveMotorAngleRel('A', 55, 90);
        brick.WaitForMotor('A');
        pause(2);
        brick.MoveMotor('AB', 55);
    end

end