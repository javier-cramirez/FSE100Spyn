% FIGURE OUT WHICH MOTORS TO TURN AND HOW LONG
brick.SetColorMode(4, 2);


while 1
    dist = brick.UltrasonicDist(1);
    touched = brick.TouchPressed(2);
    color = brick.ColorCode(4);

    % START
    % TURN LEFT
    brick.MoveMotor('AB', 30);

    if color == 4 || color == 5 || color == 3
        brick.beep();
        brick.StopMotor('AB');
        run('keycontrol.m');
        % BEFORE ENDING KEY, ORIENT MOTOR PROPERLY
        pause(3);
    end

    brick.MoveMotor('AB', 30);
    
    if touched 
        brick.StopMotor('AB');
        brick.MoveMotor('AB', -30);
        pause(1);
        brick.StopMotor('AB');
        brick.MoveMotorAngleRel('B', 30, 90);
        brick.WaitForMotor('B');
        brick.MoveMotor('AB', 30);
        pause(4);
    end


    

    % MANUAL CONTROL
    

    % LEAVING YELLER
    brick.MoveMotor('AB', 30);

    % HOW TO LEAVE?
    % WHEN WE REACH LAST WALL OUT, TURN LEFT
    if dist < 4
        pause(3);
        brick.MoveMotorAngleRel('B', 30, 90);
        brick.WaitForMotor('B');
        % MOVE FORWARD UNTIL GREEN
        brick.MoveMotor('AB', 30);
    end

    % IF WALL NOT THERE, TURN
    if dist > 4
        pause(1);
        brick.MoveMotorAngleRel('A', 30, 90);
        brick.WaitForMotor('A');
        pause(2);
        brick.MoveMotor('AB', 30);
    end

end