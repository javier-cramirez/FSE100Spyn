global key 
initKeyboard();
while 1
    pause(0.5);
    switch key
        case 'uparrow'
            brick.MoveMotor('AB', 30);
        case 'downarrow'
            brick.MoveMotor('AB', -30);
        case 'leftarrow'
            brick.MoveMotor('A', 30);
            brick.MoveMotor('B', -30);
        case 'rightarrow'
            brick.MoveMotor('B', 30);
            brick.MoveMotor('A', -30);
        case 'open'
            brick.MoveMotor('C', -50);
        case 'close'
            brick.MoveMotor('C', 50);
        case 'c'
            break;
    end
end