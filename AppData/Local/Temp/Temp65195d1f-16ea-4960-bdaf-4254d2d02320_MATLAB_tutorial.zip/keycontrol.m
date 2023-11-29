global keybaby 
InitKeyboard();
while 1
    switch keybaby

        % Maneuever the model
        case 'uparrow'
            brick.MoveMotor('AB', 25);
        case 'downarrow'
            brick.MoveMotor('AB', -25);
        case 'leftarrow'
            brick.MoveMotor('A', 25);
            brick.MoveMotor('B', -25);
        case 'rightarrow'
            brick.MoveMotor('B', 25);
            brick.MoveMotor('A', -25);
        case 'enter'
            beep();

        % Speed forward, speed backwards
        case 'z'
            brick.MoveMotor('AB', 40);
        case 'x'
            brick.MoveMotor('AB', -40);

        % Slow forward, slow backwards
        case 'n'
            brick.MoveMotor('AB', 10);
        case 'm'
            brick.MoveMotor('AB', -10);

        % Open and close claw
        case 'c'
            brick.MoveMotor('C', -10);
        case 'o'
            brick.MoveMotor('C', 10);

        % For stopping respective motors
        case 'a'
            brick.StopMotor('C');
        case 'b'
            brick.StopMotor('AB');

        % Finish execution
        case 'q'
            brick.StopMotor('AB');
            brick.StopMotor('A');
            brick.StopMotor('B');
            brick.StopMotor('C');
            break;
    end
end