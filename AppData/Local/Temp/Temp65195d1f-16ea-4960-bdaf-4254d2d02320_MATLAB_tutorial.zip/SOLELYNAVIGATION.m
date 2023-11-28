% FIGURE OUT WHICH MOTORS TO TURN AND HOW LONG

while 1
    dist = brick.UltrasonicDist(1);
    touched = brick.TouchPressed(2);

    % START
    % TURN LEFT
    brick.MoveMotorAngleRel('B', 30, 90);
    brick.WaitForMotor('B');
    brick.MoveMotor('AB', 30);
    pause(1.5);

    % MOVE FORWARD, STOP AND TURN RIGHT
    brick.StopMotor('AB');
    brick.MoveMotorAngleRel('A', 30, 90);
    brick.WaitForMotor('A');
    pause(1);

    % MOVE FORWARD AND TURN LEFT
    brick.MoveMotor('AB', 30);
    pause(1.5);
    brick.StopMotor('AB');

    brick.MoveMotorAngleRel('B', 30, 90);
    brick.WaitForMotor('B');
    pause(1);

    % MOVE UNTIL REACH YELLER
    brick.MoveMotor('AB', 20);
    pause(1.5);

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
    if color == 4 || color == 5 || color == 3
        brick.beep();
        brick.StopMotor('AB');
        run('keycontrol.m');
        % BEFORE ENDING KEY, ORIENT MOTOR PROPERLY
        pause(5);
    end

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