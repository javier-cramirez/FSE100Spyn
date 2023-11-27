brick.SetColorMode(4, 2);

while 1
    brick.MoveMotorAngleRel('B', 30, 90);
    brick.WaitForMotor('B');
    brick.MoveMotor('AB', 30);
    pause(1.5);
    brick.StopMotor('AB');
    brick.MoveMotorAngleRel('A', 30, 90);
    brick.WaitForMotor('A');
    pause(1);
    % Alternate logic for turning

    if dist < 4
        pause(1);
        brick.StopAllMotors('brake');
        brick.MoveMotorAngleRel('B', 30, 90);
        brick.WaitForMotor('B');
        brick.StopMotor('B');
        brick.MoveMotor('AB', 30);
        pause(1.5);
    end
    brick.StopAllMotors('brake');
    brick.MoveMotorAngleRel('B', 30, 90);
    brick.WaitForMotor('B');
    pause(1);
    brick.MoveMotor('AB', 20);

    if color == 4 || color == 5 || color == 3
        brick.StopAllMotors('brake');
        run('keycontrol.m');
        pause(5);
    end

    brick.StopMotor('A');
    brick.MoveMotor('AB', 30);
    pause(1.5);
    brick.StopMotor('AB');
    brick.MoveMotor('A', 30, 90)

    if dist > 4
        pause(2);
        brick.MoveMotorAngleRel('A', 30, 90);
        brick.WaitForMotor('A');
        pause(1);
        brick.StopAllMotors('brake');
        pause(2);
        brick.MoveMotor('AB', 30);
    end

end