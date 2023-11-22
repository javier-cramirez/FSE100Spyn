brick.SetColorMode(4, 1);

while 1
    color = brick.ColorCode(4);
    dist = brick.UltrasonicDist(2);
    touch = brick.TouchPressed(3);

    brick.MoveMotor('AB', 50);

    if touch
        brick.MoveMotorAngleAbs('A', 50, 180);
        pause(2);
        brick.WaitForMotor('A');
        brick.StopMotor('A');

        brick.MoveMotor('AB', 50);
        pause(2);
        brick.WaitForMotor('AB');
        brick.StopMotor('AB');

        brick.MoveMotor('C', -50);
        pause(2);
        brick.WaitForMotor('C');
        brick.StopMotor('C');

        brick.MoveMotor('C', 50);
        pause(2);
        brick.WaitForMotor('C');
        brick.StopMotor('C');
        
        pause(0.5);
        brick.MoveMotor('AB', 50);
        brick.StopMotor('AB');
    end
end