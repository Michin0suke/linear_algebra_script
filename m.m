% �V���[�g�J�b�g
e = exp(1);
% ���f����ϐ��Ƃ����Ȃ�����
clear i

disp("'li'�Ɠ��͂���ƃR�}���h�ꗗ��\���ł��܂�");
input_command = input('m > ','s');

switch input_command
    case 'li'
        disp(' ')
        fprintf("[ �R�}���h�ꗗ ]\n\n");
        fprintf("cmd:\tMATLAB�̃R�}���h�ꗗ��\��\n");
        fprintf("inv:\t�t�s��\n");
        fprintf("format:\tformat short / format long\n");
        fprintf("error:\t��Ό덷 / ���Ό덷 / �L������\n");
        fprintf("nerror:\t�m������Ό덷 / ���Ό덷 / �L������\n");
        fprintf("basic:\t�����̑����Z / �����Z / �|���Z / ����Z\n");
        fprintf("normal:\t���K��\n");
        fprintf("normav:\t���K�������\n");
        fprintf("angle:\t��̃x�N�g���̂Ȃ��p\n");
        fprintf("norm:\t�m����\n");
        fprintf("times:\t��̔z�� / �x�N�g���̊|���Z\n");
        fprintf("gauss:\t�ꎟ�A��������\n");
        fprintf("rank:\t�����N\n");
        fprintf("sym:\t���ɑΏ̂ȃx�N�g��\n");
        fprintf("rotate:\t��]�s��\n");
        fprintf("diagv:\t�Ίp���\�ƕs�\�̔���\n");
        fprintf("diag:\t�Ίp��\n");
        fprintf("bde:\t��{�ό`�s��\n");
        fprintf("gen:\t����̈�ʍ�\n");
        fprintf("quit:\t�I��\n\n");
        m %�ċA
    case 'cmd'
        fprintf("MATLAB �֐��ꗗ\n\n\n");
        fprintf("inv(A):\t\t�t�s��\n\n");
        fprintf("rank(A):\t\t�����N\n\n");
        fprintf("sqrt(n):\t������\n\n");
        fprintf("eig:\t\t�ŗL�l�E�ŗL�x�N�g�� [V,��] = eig(A)\n\n");
        fprintf("norm(A):\t��Βl\n\n");
        fprintf("det(A):\t\t�s��\n\n");
        fprintf("dot(x,y):\t\t����\n\n");
        fprintf("eye(x,y):\t\t�P�ʍs��Beye(�s��, ��)\n\n");
        fprintf("zeros(x,y):\t\t��s��Bzeros(�s��, ��)\n\n");
        fprintf("ones(x,y):\t\t�S�Ă�1�̍s��Bones(�s��, ��)\n\n");
        fprintf("rand(x,y):\t\t�����s��Brand(�s��, ��)\n\n");
        fprintf("A.':\t\t�]�u�iA'�ł��ł��邪�A���f�x�N�g���������Ƃ��ɖ�肪����j\n\n");
        fprintf("x .* A:\t\t�v�f���ꂼ��ɂ�����\n\n");
        fprintf("round():\t���l���ۂ߂�B��2��10���Ɋۂ߂��) round(sqrt(2), 10, 'significant')\n\n");
        m�@%�ċA

    case 'inv'
        % �����s��̃T�C�Y�̌���
        fprintf('�����s��̍s��(=��)����͂��Ă�������');

        input_size = input_repeat(0);
                if input_size == 'E'
                    return
                end

        V = input_A ( input_size ,"A");
        if V == 'E'
            return;
        end
        inv_V = inv(V);

        % �����ɕ��f�����܂܂��ꍇ
        if isreal(inv_V) == false
            fprintf('\n\n�����ɕ��f�����܂܂�Ă����̂ŏc�����ŕ\������܂�\n\n');
            disp(' ');
            fprintf('\n V ^(-1) �� \n\n');
            disp(inv(V));
            disp(' ');
            return;
        end

        fprintf('\n \n\n');
        yoko = 1; sita = 1;

        % �f�B�X�v���C�p�ɓ]�u���Ȃ��Ƃ����Ȃ��Ǝv������ł�������������܂����B
        DISP_inv_V = inv_V.';
        DISP_inv_V = round( DISP_inv_V , 5);
        % �Ȃ��� -0 �ƕ\�������̂���������邢�̂�
        for i=1 : input_size^2
            if DISP_inv_V(i) == 0
                DISP_inv_V(i) = 0;
            end
        end

        % �Ίp���ł��Ȃ��Ƃ��̏���
        if det(round(V,8)) == 0  %�@�s�񎮁�0�@���@�����łȂ��@���@�Ίp���ł��Ȃ�
            if input_size == 2
            fprintf(" V = | %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita));
            fprintf("     | %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1));
            fprintf("�ŗL�x�N�g������ׂč�����s�� V = [v1 v2] �͐����łȂ��̂ŁA�Ίp���s�\�B\n");
            elseif input_size == 3
            fprintf("     | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita),  DISP_inv_V(yoko+2,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1),DISP_inv_V(yoko+2,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+2),DISP_inv_V(yoko+1,sita+2),DISP_inv_V(yoko+2,sita+2));
            fprintf("�ŗL�x�N�g������ׂč�����s�� V = [v1 v2 v3] �͐����łȂ��̂ŁA�Ίp���s�\�B\n");
            elseif input_size == 4
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita),  DISP_inv_V(yoko+2,sita),  DISP_inv_V(yoko+3,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+1),  DISP_inv_V(yoko+1,sita+1),  DISP_inv_V(yoko+2,sita+1),  DISP_inv_V(yoko+3,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+2),  DISP_inv_V(yoko+1,sita+2),  DISP_inv_V(yoko+2,sita+2),  DISP_inv_V(yoko+3,sita+2));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+3),  DISP_inv_V(yoko+1,sita+3),  DISP_inv_V(yoko+2,sita+3),  DISP_inv_V(yoko+3,sita+3));
            fprintf("�ŗL�x�N�g������ׂč�����s�� V = [v1 v2 v3 v4] �͐����łȂ��̂ŁA�Ίp���s�\�B\n");
            end
            disp(' ');
            fprintf("�����s�� A �̌ŗL�x�N�g������ׂč�����s�� V �̍s�� �� 0\n�@�@�� �s�� V �͐����łȂ�\n�@�@�� �����s�� A �͑Ίp���ł��Ȃ�");
            return;
        end
        if input_size == 2
            fprintf("  -1\n");
            fprintf(" V = | %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita));
            fprintf("     | %10.5G %10.5G |\n\n",DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1));
        elseif input_size == 3
            fprintf("  -1 | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita),  DISP_inv_V(yoko+2,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1),DISP_inv_V(yoko+2,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G |\n\n",DISP_inv_V(yoko,sita+2),DISP_inv_V(yoko+1,sita+2),DISP_inv_V(yoko+2,sita+2));
        elseif input_size == 4
            fprintf("  -1 | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita),  DISP_inv_V(yoko+2,sita),  DISP_inv_V(yoko+3,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+1),  DISP_inv_V(yoko+1,sita+1),  DISP_inv_V(yoko+2,sita+1),  DISP_inv_V(yoko+3,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+2),  DISP_inv_V(yoko+1,sita+2),  DISP_inv_V(yoko+2,sita+2),  DISP_inv_V(yoko+3,sita+2));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n\n",DISP_inv_V(yoko,sita+3),  DISP_inv_V(yoko+1,sita+3),  DISP_inv_V(yoko+2,sita+3),  DISP_inv_V(yoko+3,sita+3));
        end

        disp(' ');

    case 'format'
        value=input('a > ');
        format short
        disp("Short:")
        disp(value)
        disp("Long:")
        format long
        disp(value)

    case 'error'
        a=input('�^�l > ');
        b=input('�ߎ��l > ');
        disp(' ')
        ab_error = abs(a-b);
        disp('��Ό덷:')
        disp(ab_error)
        re_error = ab_error / abs(a);
        disp('���Ό덷:')
        disp(re_error)
        keta = -log10(re_error);
        disp('�L������:')
        disp(keta)

    case 'nerror'
        a=input('�^�l > ');
        b=input('�ߎ��l > ');
        disp(' ')
        abs_error_1 = norm(a-b, 1);
        abs_error_2 = norm(a-b);
        abs_error_inf = norm(a-b, 'inf');
        abs_error_fro = norm(a-b, 'fro');
        disp('�m������Ό덷(1�m����):')
        disp(abs_error_1)
        disp('�m������Ό덷(���[�N���b�h�m����):')
        disp(abs_error_2)
        disp('�m������Ό덷(������m����):')
        disp(abs_error_inf)
        disp('�m������Ό덷(Frobenius�m����):')
        disp(abs_error_fro)
        disp(' ')
        rel_error_1 = abs_error_1 / norm(a, 1);
        rel_error_2 = abs_error_2 / norm(a);
        rel_error_inf = abs_error_inf / norm(a, 'inf');
        rel_error_fro = abs_error_fro / norm(a, 'fro');
        disp('�m�������Ό덷(1�m����):')
        disp(rel_error_1)
        disp('�m�������Ό덷(���[�N���b�h�m����):')
        disp(rel_error_2)
        disp('�m�������Ό덷(������m����):')
        disp(rel_error_inf)
        disp('�m�������Ό덷(Frobenius�m����):')
        disp(rel_error_fro)

    case 'basic'
        a = input('a > ');
        b = input('b > ');
        fprintf("%d + %d = %d\n",a,b,a+b);
        fprintf("%d - %d = %d\n",a,b,a-b);
        fprintf("%d �~ %d = %d\n",a,b,a*b);
        fprintf("%d �� %d = %d\n",a,b,a/b);

    case 'normal'
        fprintf("���K�������� X �x�N�g���̎���������͂��Ă��������B���͂R����");
        N = input_repeat(0);
        if N == 'E'
            return
        end
        X = input_XA(N,"X");
        if X == 'E'
            return
        end
        fprintf('\n  \n\n');
        fprintf(" ||X|| = %G���AX �𐳋K�������x�N�g�� Y �́A\n\n",norm(X));
        fprintf("         1          1  |%3.2G |     |%6.4G |\n",X(1,1),X(1,1)/norm(X));
        fprintf(" Y  =  �������� X  =  �������� |%3.2G |  =  |%6.4G |\n",X(2,1),X(2,1)/norm(X));
        fprintf("       ||X||      %5.3G|%3.2G |     |%6.4G |\n\n",norm(X),X(3,1),X(3,1)/norm(X));
        fprintf('\n  \n\n');

    case 'normav'
        N = input('���K�������� X �x�N�g���̎���������͂��Ă��������B(2 or 3) > ');
        if ne(N, 3) && ne(N, 2)
            disp('error: �������ɂ�2��3�ɂ����Ή����Ă��܂���B')
            return
        end
        a = input_XA(N,"a");
        if a == 'E'
            return
        end
        b = input_XA(N,"b");
        if b == 'E'
            return
        end
        u = X / norm(X);

        fprintf('\n  \n\n');
        fprintf(" ||a|| = %G���Aa �𐳋K�������x�N�g�� u �́A\n\n",norm(u));
        fprintf("         1          a     \n");
        fprintf(" u  =  �������� a  =  ��������    \n");
        fprintf("       ||a||(2)   ||a||(2)  \n\n\n");
        switch N
            case 2
                fprintf("         1          1                       \n");
                fprintf(" u  =  �������� a  =  �������� |%3.2G |  =  |%6.4G |\n",a(1,1),a(1,1)/norm(a));
                fprintf("       ||a||      %5.3G|%3.2G |     |%6.4G |\n\n",norm(a),a(2,1),a(2,1)/norm(a));
            case 3
                fprintf("         1          1  |%3.2G |     |%6.4G |\n",a(1,1),a(1,1)/norm(a));
                fprintf(" u  =  �������� a  =  �������� |%3.2G |  =  |%6.4G |\n",a(2,1),a(2,1)/norm(a));
                fprintf("       ||a||      %5.3G|%3.2G |     |%6.4G |\n\n\n",norm(a),a(3,1),a(3,1)/norm(a));
            otherwise
                return
        end
        V = b - dot(b, u) * u;
        fprintf(" v'  =  b - (b, u) u \n\n");
        switch N
            case 2
                fprintf(" v'  =  |%6.4G |  -  |%6.4G | %6.4G\n",     b(1), u(1), dot(b, u));
                fprintf("        |%6.4G |     |%6.4G |      \n\n\n", b(2), u(2));
            case 3
                fprintf("        |%6.4G |     |%6.4G |      \n",     b(1), u(1));
                fprintf(" v'  =  |%6.4G |  -  |%6.4G | %6.4G\n",     b(2), u(2), dot(b, u));
                fprintf("        |%6.4G |     |%6.4G |      \n\n\n", b(3), u(3));
        end
        v = V / norm(V);
        fprintf(" v  =  v' / || v'||(2) \n\n");
        switch N
            case 2
                fprintf("        |%6.4G | \n", V(1));
                fprintf("        |%6.4G | \n", V(2));
                fprintf(" v   =  ��������������  \n");
                fprintf("         %6.4G   \n\n", norm(V));
            case 3
                fprintf("        |%6.4G | \n", V(1));
                fprintf("        |%6.4G | \n", V(2));
                fprintf("        |%6.4G | \n", V(3));
                fprintf(" v   =  ��������������  \n");
                fprintf("         %6.4G   \n\n", norm(V));
        end
        disp(' u = ')
        disp(u)
        disp(" v' = ")
        disp(V)
        disp(" v = ")
        disp(v)

    case 'angle'
        fprintf("�x�N�g�� X �̎���������͂��Ă�������");
        n = input_repeat(0);
        if n == 'E'
            return
        end
        fprintf(" X �x�N�g������͂��Ă�������\n");
        X = input_XA(n,"X");
            if X == 'E'
            return
            end
        fprintf(" Y �x�N�g������͂��Ă�������\n");
        Y = input_XA(n,"Y");
            if Y == 'E'
            return
            end
        cos_theta = (X.'*Y) / (norm(X) * norm(Y));
        theta = acos(cos_theta);
        fprintf('\n \n\n');
        switch n
            case 2
                fprintf(" ( X , Y ) =");
                for i = 1 : n
                    fprintf(" %G �~ %G ",X(i,1),Y(i,1));
                    if i == n
                        fprintf("�� %G\n\n",X(1,1)*Y(1,1)+X(2,1)*Y(2,1));
                    else
                    fprintf("�{");
                    end
                end
                fprintf(" �@||X|| �� %0.3f \n",norm(X));
                fprintf(" �@||Y|| �� %0.3f \n\n",norm(Y));
                fprintf("������ ( X , Y ) �� ||X|| ||Y||cos�Ƃ��A\n\n");
                fprintf(" �@cos�� �� %0.3f \n\n",cos_theta);
                fprintf("        ( X , Y )     -1    \n");
                fprintf(" �� �� - cos      \n");
                fprintf("       ||X|| ||Y||          \n\n");
                fprintf(" �� �� %f\n\n",theta);
                fprintf("X = |%3G | �� Y =|%3G | ���Ȃ��p�Ƃ� %3G �ł��B\n" ,X(1,1),Y(1,1),theta);
                fprintf("    |%3G |       |%3G |\n"                         ,X(2,1),Y(2,1));
            case 3
                fprintf(" ( X , Y ) =");
                for i = 1 : n
                    fprintf(" %G �~ %G ",X(i,1),Y(i,1));
                    if i == n
                        fprintf("�� %G\n\n",X(1,1)*Y(1,1)+X(2,1)*Y(2,1)+X(3,1)*Y(3,1));
                    else
                    fprintf("�{");
                    end
                end
                fprintf(" �@||X|| �� %0.3f \n",norm(X));
                fprintf(" �@||Y|| �� %0.3f \n\n",norm(Y));
                fprintf(" �� �� %f\n\n",theta);
                fprintf("������ ( X , Y ) �� ||X|| ||Y||cos�Ƃ��A\n\n");
                fprintf("        ( X , Y )     -1    \n");
                fprintf(" �� �� - cos      \n");
                fprintf("       ||X|| ||Y||          \n\n");
                fprintf(" �@cos�� �� %0.3f \n\n",cos_theta);
                
                fprintf("    | %3G |       | %3G |\n"                         ,X(1,1),Y(1,1));
                fprintf("X = | %3G | �� Y =| %3G | ���Ȃ��p�Ƃ� %3G �ł��B\n" ,X(2,1),Y(2,1),theta);
                fprintf("    | %3G |       | %3G |\n"                         ,X(3,1),Y(3,1));
            case 4
                fprintf(" ( X , Y ) =");
                for i = 1 : n
                    fprintf(" %G �~ %G ",X(i,1),Y(i,1));
                    if i == n
                        fprintf("�� %G\n\n",X(1,1)*Y(1,1)+X(2,1)*Y(2,1)+X(3,1)*Y(3,1));
                    else
                    fprintf("�{");
                    end
                end
                fprintf(" �@||X|| �� %0.3f \n",norm(X));
                fprintf(" �@||Y|| �� %0.3f \n\n",norm(Y));
                fprintf("������ ( X , Y ) �� ||X|| ||Y||cos�Ƃ��A\n\n");
                fprintf(" �@cos�� �� %0.3f \n\n",cos_theta);
                fprintf("        ( X , Y )     -1    \n");
                fprintf(" �� �� - cos      \n");
                fprintf("       ||X|| ||Y||          \n\n");
                fprintf(" �� �� %f\n\n",theta);
                fprintf("    |%3G |       |%3G |\n"                         ,X(1,1),Y(1,1));
                fprintf("X = |%3G | �� Y =|%3G | ���Ȃ��p�Ƃ� %3G �ł��B\n" ,X(2,1),Y(2,1),theta);
                fprintf("    |%3G |       |%3G |\n"                         ,X(3,1),Y(3,1));
                fprintf("    |%3G |       |%3G |\n"                         ,X(4,1),Y(4,1));
            otherwise
                fprintf("ERROR");
        end
        fprintf('\n \n');
        fprintf("�q�|�C���g�rX��x�x�N�g���AY��y�x�N�g����\���Ă��܂�\n");
    case 'norm'
        a = input('a > ');
        fprintf("||a||\t\t= %f�i���[�N���b�h�m�����B||a||(2)�Ƃ��B�j\n",norm(a));
        fprintf("||a||(1)\t= %f\n",norm(a,1));
        fprintf("||a||(��)\t= %f\n",norm(a,'inf'));
        fprintf("||a||(f)\t= %f�iFrobenius�m�����B�j\n",norm(a,'fro'));
    case 'times'
        fprintf("         �z��^�C�v�ꗗ  \n");
        fprintf(" |                                                | \n");
        fprintf(" |   �@��|�Z|     �A��|�Z|       �B��|�Z|          | \n");
        fprintf(" |       |�Z|         |�Z|           |�Z|         | \n");
        fprintf(" |                    |�Z|           |�Z|         | \n");
        fprintf(" |                                   |�Z|         | \n");
        fprintf(" |                                                | \n");
        fprintf(" |   �C��|�Z�Z|   �D��|�Z�Z�Z|   �E��|�Z�Z�Z�Z|    | \n");
        fprintf(" |                                                | \n");
        fprintf(" |   �F��|�Z�Z|   �G��|�Z�Z�Z|   �H��|�Z�Z�Z�Z|    | \n");
        fprintf(" |       |�Z�Z|       |�Z�Z�Z|       |�Z�Z�Z�Z|   | \n");
        fprintf(" |                    |�Z�Z�Z|       |�Z�Z�Z�Z|   | \n");
        fprintf(" |                                   |�Z�Z�Z�Z|   | \n");
        fprintf(" |                                                | \n");
        fprintf("         \n\n");

        fprintf("\n�|���Z���鍶���̔z��̃^�C�v���������Ă�������");
        fprintf("\n\n �Z�~�Z\n �� ������");
        first_array = input_repeat(0);
        if first_array == 'E'
            A = 'E';
            return
        end
        fprintf("\n\n�|���Z����E���̔z��̃^�C�v���������Ă�������");
        fprintf("\n\n(%d)�~�Z\n     �� ������",first_array);
        second_array = input_repeat(0);
        if second_array == 'E'
            A = 'E';
            return
        end
        fprintf("\n\n(%d)�~(%d)\n\n",first_array,second_array);
        % �v�Z�ł��Ȃ��ꍇ       
        switch first_array
            case { 1, 2, 3 }
                length = 1;
            case { 4, 7 }
                length = 2;
            case { 5, 8 }
                length = 3;
            case { 6, 9 }
                length = 4;
            otherwise
                length = 0;
        end
        
        switch second_array
            case { 4, 5, 6 }
                height = 1;
            case { 1, 7 }
                height = 2;
            case { 2, 8 }
                height = 3;
            case { 3, 9 }
                height = 4;
            otherwise
                height = 0;
        end
        
        if height == 0 || length == 0
            fprintf("�z��̃^�C�v�͂P�`�X�ɂ����Ή����Ă��܂���B");
            return
        end
        if ne(length,height)
            fprintf('\n     -\n');
            fprintf("\n �I�񂾃^�C�v�� %d �� %d �ł����A���̔z��%d��Ȃ̂ɑ΂��A�E�̔z��%d�s�ł���̂�", first_array, second_array, length, height);
            fprintf("\n �����̔z��̗񐔁i���̒����j�ƉE���̔z��̍s���i�c�̒����j���Ⴄ�̂Ōv�Z�ł��܂���B\n");
            fprintf('\n     -\n');
            return
        end
        
        %   -
        
        switch first_array
            case 1
                first_array = input_XA (2,"X");
                if first_array == 'E'
                        A = 'E';
                        return
                end
            case 2
                first_array = input_XA (3,"X");
                if first_array == 'E'
                    A = 'E';
                    return
                end
            case 3
                first_array = input_XA (4,"X");
                if first_array == 'E'
                    A = 'E';
                    return
                end
            case 4
                first_array = input_XB (2,"X");
                if first_array == 'E'
                    A = 'E';
                    return
                end
            case 5
                first_array = input_XB (3,"X");
                if first_array == 'E'
                    A = 'E';
                    return
                end
            case 6
                first_array = input_XB (4,"X");
                if first_array == 'E'
                    A = 'E';
                    return
                end
            case 7
                first_array = input_A (2,"X");
                if first_array == 'E'
                    A = 'E';
                    return
                end
            case 8
                first_array = input_A (3,"X");
                if first_array == 'E'
                    A = 'E';
                    return
                end
            case 9
                first_array = input_A (4,"X");
                if first_array == 'E'
                    A = 'E';
                    return
                end
        end
        
        switch second_array
            case 1
                second_array = input_XA (2,"Y");
                if second_array == 'E'
                    A = 'E';
                    return
                end
            case 2
                second_array = input_XA (3,"Y");
                if second_array == 'E'
                    A = 'E';
                    return
                end
            case 3
                second_array = input_XA (4,"Y");
                if second_array == 'E'
                    A = 'E';
                    return
                end
            case 4
                second_array = input_XB (2,"Y");
                if second_array == 'E'
                    A = 'E';
                    return
                end
            case 5
                second_array = input_XB (3,"Y");
                if second_array == 'E'
                    A = 'E';
                    return
                end
            case 6
                second_array = input_XB (4,"Y");
                if second_array == 'E'
                    A = 'E';
                    return
                end
            case 7
                second_array = input_A (2,"Y");
                if second_array == 'E'
                    A = 'E';
                    return
                end
            case 8
                second_array = input_A (3,"Y");
                if second_array == 'E'
                    A = 'E';
                    return
                end
            case 9
                second_array = input_A (4,"Y");
                if second_array == 'E'
                    A = 'E';
                    return
                end
        end
        
        fprintf('\n        \n\n');
        disp(first_array);
        fprintf("         �~\n\n");
        disp(second_array);
        fprintf("         ||\n\n");
        disp(first_array * second_array);
        fprintf('        \n\n');

    case 'gauss'
        fprintf("�����s�� A �̍s��(=��)����͂��Ă�������\n����͂Q�A�R�ɂ����Ή����Ă��܂���B");
        N = input_repeat(0);
        if N == 'E'
            return
        end
        if ne(N,2) && ne(N,3)
            fprintf("�����s��̃T�C�Y�͂Q���R�ɂ����Ή����Ă܂���B���߂�Ȃ���( T�DT)����ְ \n\n")
            return
        end
       
        X = input_A(N,"X");
            if X == 'E'
                return
            end
        
        seihou_X = X;
        
        I = input_XA(N,"I");
                if I == 'E'
                return
                end
        
        X = cat(2,X,I);

        fprintf('\n        \n\n');
            X = Hakidashi(X,N); % �|���o���֐��̕��œ��o���̏o�͂͊�������B
        fprintf('\n        \n\n');

        v = 0;
        itijikansuu_print(X,0,0,0,i,v,N);
        RANK_switch(seihou_X,X,N);

    case 'sym'
        fprintf("�Ώ̈ړ��������� X �x�N�g���̎���������͂��Ă��������B\n����͂Q�����܂��͂R�����x�N�g���ɂ����Ή����Ă��܂���B");
        input_size = input_repeat(0);
        if input_size == 'E'
            return
        end
        if ne(input_size,2)&&ne(input_size,3)
            fprintf("�x�N�g���̃T�C�Y�͂Q���R�ɂ����Ή����Ă܂���B\n���߂��( T�DT)����ְ\n");
            return
        end
        fprintf(" X �x�N�g������͂��Ă�������\n");
        X = input_XA ( input_size ,"X");
        if X == 'E'
            return
        end
        [p,n] = size(X);
        fprintf("���ɑ΂��đΏ̂ɂ��܂����H\n");
        fprintf("�q�I�����r�@x1 : x1��(x��)�Ώ�\n");
        fprintf("�@�@�@�@�@�@x2 : x2��(y��)�Ώ�\n");
        fprintf("�@�@�@�@�@�@x3 : x3��(z��)�Ώ́i�x�N�g���̎������R�̂Ƃ�����j\n");
        fprintf("�@�@�@�@�@�@genten : ���_�Ώ�\n");
        for i=1:3
        x1orx2 = input_repeat(1);
        if x1orx2 == 'E'
            return
        end
        if x1orx2 == "x1" || x1orx2 == "x2" || x1orx2 == "x3" || x1orx2 == "genten"
            break
        elseif i == 3
            fprintf("���Ȃ����Ă��������B���߂�ˁB");
            return
        else
            fprintf(" x1 , x2 , x3 , genten �̂����ꂩ����͂��Ă��������B");
        end
        end
        switch x1orx2
            case "x1"
                x_num = 1;
                jiku = "x1��";
            case "x2"
                x_num = 2;
                jiku = "x2��";
            case "x3"
                if ne(input_size,3)
                    fprintf("x3���Ώ̂͂R�����x�N�g���łȂ��Ƃł��܂���");
                    return
                end
                x_num = 3;
                jiku = "x3��";
            case "genten"
                x_num = 0;
                jiku = "���_";
            otherwise
                fprintf("error 3");
                return
        end
        XX = zeros (input_size,1);
        M = eye (input_size);
        for i=1 : p
            if ne(i,x_num)              % X���ォ�猩�čs���āAy��������Q�ڈȊO���}�C�i�X�ɁB
                XX(i,1) = -1 * X(i,1);
                M(i,i) = -1 * M(i,i);
            else
                XX(i,1) = X(i,1);
            end
        end
        fprintf("\n");
        switch input_size
            case 2
                fprintf("X = |%3G |\n",X(1,1));
                fprintf("    |%3G |\n",X(2,1));
                fprintf('\n        \n\n');
                fprintf("%s�ɑ΂��đΏ̂ȃx�N�g��X'�́A\n\n",jiku);
                fprintf("X'= |%3G |\n",XX(1,1));
                fprintf("    |%3G |\n\n",XX(2,1));
                fprintf("�܂��AX'�� MX �ƂȂ�Q�������s�� M �́A\n\n");
                fprintf(" |%3G | �� M |%3G |\n",XX(1,1),X(1,1));
                fprintf(" |%3G |      |%3G |\n\n",XX(2,1),X(2,1));
                fprintf("�ƂȂ�̂ŁA\n\n");
                fprintf("M = |%3G %3G|\n",M(1,1),M(1,2));
                fprintf("    |%3G %3G|\n",M(2,1),M(2,2));
            case 3
                fprintf("    |%3G |\n",X(1,1));
                fprintf("X = |%3G |\n",X(2,1));
                fprintf("    |%3G |\n",X(3,1));
                fprintf('\n        \n\n');
                fprintf("%s�ɑ΂��đΏ̂ȃx�N�g��X'�́A\n\n",jiku);
                fprintf("    |%3G |\n",XX(1,1));
                fprintf("X'= |%3G |\n",XX(2,1));
                fprintf("    |%3G |\n\n",XX(3,1));
                fprintf("�܂��AX'�� MX �ƂȂ�Q�������s�� M �́A\n\n");
                fprintf(" |%3G |      |%3G |\n",XX(1,1),X(1,1));
                fprintf(" |%3G | �� M |%3G |\n",XX(2,1),X(2,1));
                fprintf(" |%3G |      |%3G |\n\n",XX(3,1),X(3,1));
                fprintf("�ƂȂ�̂ŁA\n\n");
                fprintf("    |%3G %3G %3G|\n",M(1,1),M(1,2),M(1,3));
                fprintf("M = |%3G %3G %3G|\n",M(2,1),M(2,2),M(2,3));
                fprintf("    |%3G %3G %3G|\n",M(3,1),M(3,2),M(3,3));
        end
        fprintf('\n        \n');
        fprintf("�q�|�C���g�r\nxn���ɑΏ̂ȃx�N�g��X'�́AX��n�ԖڈȊO�̂��ׂĂ̗v�f���}�C�i�X�ɂ���΂�����I\n");
        fprintf("�Ⴆ�΁Ax1���ɑΏ̂ȃx�N�g��X'�����߂����Ȃ�A��ԏ�ȊO�̗v�f�ɂ��ׂ�-1��������΂����킯�ł�\n");

    case 'rotate'
        fprintf("\n��]���������x�N�g�� X ����͂��Ă�������\n");
        X = input_XA ( 2 ,"X");
        if X == 'E'
            return
        end
        fprintf("\n\n X = |%3G |\n     |%3G |\n\n",X(1,1),X(2,1));
        fprintf(" X �x�N�g������]������p�x����͂��Ă��������B\n(��/5 �̂悤�Ȑ��l�� 180/5 �̂悤�Ƀ΂�180�ɕϊ����ē��͂��Ă�������)");
        r = input_repeat(0);
        if r == 'E'
            return
        end
        R = [cosd(r) -sind(r) ; sind(r) cosd(r)];
        Answer = R * X;
        fprintf("\n\n X = |%3G | �� %G����]������ƁA\n     |%3G |\n",X(1,1),r,X(2,1));
        fprintf('\n           \n\n');
        fprintf(" R(%4G ) X �� | cos( %G ) -sin( %G ) | |%3G | �� | %6G %6G | |%3G | �� |%7G |\n",r,r,r,X(1,1),round(cosd(r),3),round(-sind(r),3),X(1,1),round(Answer(1,1),4));
        fprintf("               | sin( %G )  cos( %G ) | |%3G |    | %6G %6G | |%3G |    |%7G |\n",r,r,X(2,1),round(sind(r),3),round(cosd(r),3),X(2,1),round(Answer(2,1),4));
        fprintf('\n           \n\n');
    
    case 'diagv'
        fprintf("�����s�� A �̍s��(=��)����͂��Ă�������\n���� 2 �ɂ����Ή����Ă��܂���B");
        N = input_repeat(0);
        if N == 'E'
            return
        end
        if N == 3
            fprintf("3�~3�̐����s��̑Ίp���\���̔��ʂ͕��G�Ȃ̂Ō���Ή����Ă��܂���B");
            twitter();
            return;
        end
        if ne(N,2) && ne(N,3)
            fprintf("�x�N�g���̎����͂Q�ɂ����Ή����Ă܂���B");
            return
        end
         A = input_A(N,"A");
        if A == 'E'
            return
        end
        fprintf("\n");
        fprintf("�����s�� A ���Ίp���\���ǂ������u�ŗL�l�v�u�ŗL�x�N�g���v�u�����N�v�Ƃ������t���g���Đ�������B\n");
        fprintf('\n           \n\n');
        switch N
            case 2
            fprintf(" A = | %3G %3G |\n",A(1,1),A(1,2));
            fprintf("     | %3G %3G |\n\n",A(2,1),A(2,2));
                
            fprintf(" | A - ��I | = 0 \n\n");
            fprintf(" | %3G-�� %5G | = 0\n",A(1,1),A(1,2));
            fprintf(" | %5G %3G-�� |\n\n",A(2,1),A(2,2));
            DISP_A = round(A,3);
            
            [P,lambda] = eig(A);
            P = round(P, 12);
            lambda = eig(A);
            
            if A(1,1) == 0 && A(2,2) == 0
                    fprintf(" ��- ",A(1,1),A(2,2));
                elseif A(1,1) == 0
                    fprintf(" -��( %G-�� ) ",A(2,2));
                elseif A(2,2) == 0
                    fprintf(" -��( %G-�� ) ",A(1,1));
                elseif A(1,1) == A(2,2)
                    fprintf("           2\n");
                    fprintf(" (%3G - �� ) ",A(1,1));
                elseif ne(A(1,1),0) && ne(A(2,2),0)
                    fprintf(" ( %G-�� )( %G-�� ) ",A(1,1),A(2,2));
                else
                    fprintf("error22");
                    return
            end
                
                if A(2,1) == 0 || A(1,2) == 0
                      fprintf("= 0\n\n");
                elseif ne(A(2,1),0) && ne(A(1,2),0)
                    if A(2,1)*A(1,2)<0
                        MM = A(2,1)*A(1,2)*(-1);
                        fprintf("+ %G = 0\n\n",MM);
                    else
                        fprintf("- %G = 0\n\n",A(2,1)*A(1,2));
                    end
                else
                    fprintf("error23");
                    return
                end
            
            % �d���̏ꍇ
            if round(lambda(1,1),8) == round(lambda(2,1),8)
                lam_A_rank=0;
                
                kai = "�݂̂̏d��";
                fprintf("�� = %G \n\n",lambda(1,1));

                fprintf("����������A�̌ŗL�l��%G%s�B\n",lambda(1,1),kai);
                fprintf("�ŗL�l���d���ł���ꍇ�́A�ŗL�x�N�g����C�ӂɕ��ׂč�����s�� P �������ɂȂ�ΑΊp���\�ł���B\n");
                fprintf(" P = [ v1 v2 ] �Ƃ���ƁA\n\n");
                v = 0;
                Hakidashi_seihou(P,N);
                fprintf(" rank( P ) = %d\n",rank(P));
                
                if rank(P) == N
                    fprintf("�@ �� P ���t�������N�ł���B\n");
                    fprintf("�@ �� P �͐����ł���B\n\n");
                    fprintf("����� P �������ɂȂ�悤�ɌŗL�x�N�g�����Ƃ邱�Ƃ��ł���̂ŁAA �͑Ίp���\�ł���B\n");
                    disp(' ')
                    fprintf(" �� = | %3G   0 |\n"  ,lambda(1,1));
                    fprintf("     |   0 %3G |\n\n",lambda(2,1));
                else
                    fprintf(" �@�� P �������N�������Ă���B\n");
                    fprintf("�@ �� P �͐����łȂ��B\n\n");
                    fprintf("����� P �������ɂȂ�悤�ɌŗL�x�N�g�����Ƃ邱�Ƃ��ł��Ȃ��̂ŁAA �͑Ίp���s�\�ł���B\n");
                    disp(' ')
                    fprintf(" J = | %3G   1 |\n"  ,lambda(1,1));
                    fprintf("     |   0 %3G | �i�W�����_���W���`�j\n\n",lambda(2,1));
                end
            % �قȂ��̌ŗL�l
            else
                lam_A_rank=1;
                
                kai = "�ŁA�قȂ��̌ŗL�l������";
                
                fprintf("�� = %G , %G \n\n",lambda(1,1),lambda(2,1));
                fprintf("����������A�̌ŗL�l��%G��%G%s�B\n",lambda(1,1),lambda(2,1),kai);
                fprintf("�����s�� A ���قȂ� n �̌ŗL�l�����Ƃ��A�����N���ɂ�����炸 A �͕K���Ίp���ł���B\n");
                disp(' ')
                fprintf(" �� = | %3G   0 |\n"  ,lambda(1,1));
                fprintf("     |   0 %3G |\n\n",lambda(2,1));
            end
        end

        fprintf('\n           \n\n');
        fprintf("�q���Ӂr\n");
        fprintf("�ŗL�l����=-1,-1�̂悤�ɕ\������Ă���̂ɁA�قȂ��̌ŗL�l�ƕ\������邱�Ƃ�����܂��B\n");
        fprintf("�q�|�C���g�r\n");
        fprintf("���|�[�g�̉񓚂ł� ( A - ��I ) �̃����N�����߂Ă��܂������A���߂�܂ł��Ȃ� ( A - ��I ) �͕K�������N�������܂��B\n");
        fprintf("�ŗL������  | A - ��I | V �� 0 �ōl���Ă݂�ƊȒP�ŁArank ( A - ��I ) �� n �ɂȂ�i�t�������N�ɂȂ�j�Ƃ������Ƃ́A\n");
        fprintf("���Ȃ킿 V �� 0 �ɂȂ�Ȃ���ΌŗL�����������藧���Ȃ����ƂɂȂ�܂��B\n");
        fprintf("�ŗL�l �� �ɑΉ������x�N�g���ȊO�� V �͕K�����݂���̂ŁArank ( A - ��I ) �� n �ƂȂ邱�Ƃ͂��蓾�Ȃ��Ƃ������Ƃł��B\n");
        fprintf("�Q�l�܂łɈȉ��� ( A - ��I ) �̃����N�ł��B\n\n");
        
        switch lam_A_rank
            case 0
                af_lam_A = [A(1,1)-lambda(1,1),A(1,2);A(2,1),A(2,2)-lambda(1,1)];
                RANK = rank(af_lam_A);
                fprintf("rank(A-��I) = %G\n\n",RANK);
            case 1
                lam_A_1 = [A(1,1)-lambda(1,1),A(1,2);A(2,1),A(2,2)-lambda(1,1)];
                lam_A_2 = [A(1,1)-lambda(2,1),A(1,2);A(2,1),A(2,2)-lambda(2,1)];
                RANK1 = rank(lam_A_1);
                RANK2 = rank(lam_A_2);
                fprintf("�� = %G�̂Ƃ�\n",lambda(1,1));
                fprintf("rank(A-��I) = %G\n\n",RANK1);
                fprintf("�� = %G�̂Ƃ�\n",lambda(2,1));
                fprintf("rank(A-��I) = %G\n\n",RANK2);
        end

    case 'diag'
        fprintf("A����͂����A�̑Ίp�������Ă�����I\n\n");

        % �����s��̃T�C�Y�̌���
        fprintf('�����s��̍s��(=��)����͂��Ă�������');

        input_size = input_repeat(0);
        if input_size == 'E'
            return
        end

        A = input_A ( input_size ,"A");
        if A == 'E'
            return;
        end

        [V , lambda] = eig(A);
        inv_V = inv(V);
        Answer = V \ A * V ;

        % �����ɕ��f�����܂܂��ꍇ 
        if isreal(A) == false || isreal(V) == false || isreal(inv_V) == false || isreal(Answer) == false
            fprintf('\n\n�����ɕ��f�����܂܂�Ă����̂ŏc�����ɂȂ�����I\n���ɂ����Ă��߂��(>_<)\n\n');
            disp('        ');
            fprintf('\n V ^(-1) �~ A �~ V �� \n\n');
            disp(inv(V));fprintf("          �~\n\n");disp(A);fprintf("          �~\n\n");disp(V);fprintf("          ||\n\n");
            disp( V \ A * V);
            disp('        ');
            return;
        end

        fprintf('\n        \n\n');

        % fprintf('V ^(-1) �~ A �~ V = \n\n');
        yoko = 1; sita = 1;

        % if V(1,1)*V(2,2)-V(1,2)*V(2,1) == 0

        % �f�B�X�v���C�p�ɓ]�u���Ȃ��Ƃ����Ȃ��Ǝv���Ă����B
        DISP_V = V.';
        DISP_inv_V = inv_V.';
        DISP_A = A.';
        DISP_Answer = Answer.';
        % �w���\���Ƃ����ʓ|�Ȃ̂ŁA�����_�ȉ����ۂ߂܂��B
        DISP_V = round( DISP_V , 5);
        DISP_inv_V = round( DISP_inv_V , 5);
        DISP_A = round( DISP_A , 5);
        DISP_Answer = round( DISP_Answer , 5);

        % �Ȃ��� -0 �ƕ\�������̂���������邢�̂�0 �ɕϊ�����B
        for i=1 : input_size^2
            if DISP_V(i) == 0
                DISP_V(i) = 0;
            end
        end

        for i=1 : input_size^2
            if DISP_inv_V(i) == 0
                DISP_inv_V(i) = 0;
            end
        end

        for i=1 : input_size^2
            if DISP_Answer(i) == 0
                DISP_Answer(i) = 0;
            end
        end

        % �Ίp���ł��Ȃ��Ƃ��̏���  
        if det(round(V,8)) == 0  %�@�s�񎮁�0�@���@�����łȂ��@���@�Ίp���ł��Ȃ�
            if input_size == 2
            fprintf(" V = | %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita));
            fprintf("     | %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+1),DISP_V(yoko+1,sita+1));
            fprintf("�ŗL�x�N�g������ׂč�����s�� V = [v1 v2] �͐����łȂ��̂ŁA�Ίp���s�\�B\n");
            elseif input_size == 3
            fprintf("     | %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita),  DISP_V(yoko+2,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+1),DISP_V(yoko+1,sita+1),DISP_V(yoko+2,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+2),DISP_V(yoko+1,sita+2),DISP_V(yoko+2,sita+2));
            fprintf("�ŗL�x�N�g������ׂč�����s�� V = [v1 v2 v3] �͐����łȂ��̂ŁA�Ίp���s�\�B\n");
            elseif input_size == 4
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita),  DISP_V(yoko+2,sita),  DISP_V(yoko+3,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+1),  DISP_V(yoko+1,sita+1),  DISP_V(yoko+2,sita+1),  DISP_V(yoko+3,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+2),  DISP_V(yoko+1,sita+2),  DISP_V(yoko+2,sita+2),  DISP_V(yoko+3,sita+2));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+3),  DISP_V(yoko+1,sita+3),  DISP_V(yoko+2,sita+3),  DISP_V(yoko+3,sita+3));
            fprintf("�ŗL�x�N�g������ׂč�����s�� V = [v1 v2 v3 v4] �͐����łȂ��̂ŁA�Ίp���s�\�B\n");
            end
            disp('        ');
            fprintf("�����s�� A �̌ŗL�x�N�g������ׂč�����s�� V �̍s�� �� 0\n�@�@�� �s�� V �͐����łȂ�\n�@�@�� �����s�� A �͑Ίp���ł��Ȃ�");
            return;
        end
        if input_size == 2
            fprintf(" V = | %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita));
            fprintf("     | %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+1),DISP_V(yoko+1,sita+1));
            fprintf("  -1\n");
            fprintf(" V = | %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita));
            fprintf("     | %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1));
            fprintf('            V ^(-1)         �~       A       �~              V              �� \n\n');
            fprintf(" | %10.5G %10.5G |  �~  | %3G %3G |  �~  | %10.5G %10.5G |  ��  | %10.5G %10.5G |�@\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G |     | %3G %3G |     | %10.5G %10.5G |      | %10.5G %10.5G |�@\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita));
            disp('                                                                              ~~~~~~~~~~~~~~~~~~~~~~~~~');
        elseif input_size == 3
            fprintf("     | %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita),  DISP_V(yoko+2,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+1),DISP_V(yoko+1,sita+1),DISP_V(yoko+2,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+2),DISP_V(yoko+1,sita+2),DISP_V(yoko+2,sita+2));
            fprintf("  -1 | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita),  DISP_inv_V(yoko+2,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1),DISP_inv_V(yoko+2,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+2),DISP_inv_V(yoko+1,sita+2),DISP_inv_V(yoko+2,sita+2));
            fprintf('                 V ^(-1)               �~         A         �~                    V                   �� \n\n');
            fprintf(" | %10.5G %10.5G %10.5G |     | %3G %3G %3G |     | %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G |�@\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G |  �~  | %3G %3G %3G |  �~  | %10.5G %10.5G %10.5G |  ��  | %10.5G %10.5G %10.5G |�@\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G |     | %3G %3G %3G |     | %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G |�@\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita));
            disp('                                                                                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
        elseif input_size == 4
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita),  DISP_V(yoko+2,sita),  DISP_V(yoko+3,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+1),  DISP_V(yoko+1,sita+1),  DISP_V(yoko+2,sita+1),  DISP_V(yoko+3,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+2),  DISP_V(yoko+1,sita+2),  DISP_V(yoko+2,sita+2),  DISP_V(yoko+3,sita+2));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+3),  DISP_V(yoko+1,sita+3),  DISP_V(yoko+2,sita+3),  DISP_V(yoko+3,sita+3));
            fprintf("  -1 | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita),  DISP_inv_V(yoko+2,sita),  DISP_inv_V(yoko+3,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+1),  DISP_inv_V(yoko+1,sita+1),  DISP_inv_V(yoko+2,sita+1),  DISP_inv_V(yoko+3,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+2),  DISP_inv_V(yoko+1,sita+2),  DISP_inv_V(yoko+2,sita+2),  DISP_inv_V(yoko+3,sita+2));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+3),  DISP_inv_V(yoko+1,sita+3),  DISP_inv_V(yoko+2,sita+3),  DISP_inv_V(yoko+3,sita+3));
            fprintf('                       V ^(-1)                    �~           A           �~                         V                         �� \n\n');
            fprintf(" | %10.5G %10.5G %10.5G %10.5G |     | %3G %3G %3G %3G |     | %10.5G %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G %10.5G |�@\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_inv_V(yoko+3,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_A(yoko+3,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_V(yoko+3,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita),DISP_Answer(yoko+3,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G %10.5G |  �~  | %3G %3G %3G %3G |  �~  | %10.5G %10.5G %10.5G %10.5G |  ��  | %10.5G %10.5G %10.5G %10.5G |�@\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_inv_V(yoko+3,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_A(yoko+3,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_V(yoko+3,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita),DISP_Answer(yoko+3,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G %10.5G |     | %3G %3G %3G %3G |     | %10.5G %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G %10.5G |�@\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_inv_V(yoko+3,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_A(yoko+3,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_V(yoko+3,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita),DISP_Answer(yoko+3,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G %10.5G |     | %3G %3G %3G %3G |     | %10.5G %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G %10.5G |�@\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_inv_V(yoko+3,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_A(yoko+3,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_V(yoko+3,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita),DISP_Answer(yoko+3,sita));
            disp('                                                                                                                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
        end
        disp('        ');

    case 'bde'
        fprintf("i�s�ڂ�j�s�ڂ����ւ���\tP(i,j)\n\n");
        fprintf("i�s�ڂ̐�����S��c�{����\tQ(i; c)\n\n");
        fprintf("i�s�ڂ�j�s�ڂ�c�{��������\tR(i,j;c)\n\n");

    case 'gen'
        % x_{n+2} := c1 * x_{n+1} + c0 * x_n
        fprintf("x_{n+2}  :=  c1  �~  x_{n+1}  �{  c0  �~  x_n\n\n");
        % c = [co; c1]
        fprintf("                                  ��");
        fprintf("�@c0 ����͂��Ă�������\n");
        c0 = input_repeat(0);
        if c0 == 'E'
                return
        end
        
        fprintf("\n");
        fprintf("x_{n+2}  :=  c1  �~  x_{n+1}  �{  %G  �~  x_n\n\n",c0);
        fprintf("             ��");
        fprintf("�@c1 ����͂��Ă�������\n");
        c1 = input_repeat(0);
        if c1 == 'E'
                return
        end
        
        fprintf("\n");
        fprintf("x_{n+2}  :=  %G  �~  x_{n+1}  �{  %G  �~  x_n\n\n",c1,c0);
    
        % �����l
        % x = [x0; x1]
        fprintf("�@x0 ����͂��Ă�������\n");
        x0 = input_repeat(0);
        if x0 == 'E'
                return
        end
        fprintf("�@x1 ����͂��Ă�������\n");
        x1 = input_repeat(0);
        if x1 == 'E'
                return
        end
        % x0 = 0; x1 = 1;
    
        % ����
        c = [c0; c1];
        x = [x0; x1];
        
        fprintf("\n");
        
        % fprintf("�Q�����Fx_{n+2} := (%g) * x_{n+1} + (%g) * x_n\n\n",c(2), c(1));
        fprintf("�Q�����Fx_{n+2}  :=  %G  �~  x_{n+1}  �{  %G  �~  x_n\n\n",c1,c0);
        fprintf("�����l�Fx_0 = %g\n",x(2));
        fprintf("        x_1 = %g\n\n",x(2));
    
        % Companion Matrix
        C = [0,1;c(1),c(2)];
        disp("C = "); disp(C);
    
        [P,lambda] = eig(C);
        disp("P = "); disp(P);
        disp("lambda = "); disp(lambda);
    
        % alpha
        alpha = P\x; %inv(P)*x
    
        % ��ʍ�
        fprintf("\n��ʍ��F\n");
        
        if imag(lambda(1,1)) == 0 || imag(alpha(1)) == 0 ||imag(P(1,1)) == 0 ||imag(lambda(2,2)) == 0 ||imag(alpha(2)) == 0 ||imag(P(1,2)) == 0
            fprintf("               n                                           n  \n");
        else
            fprintf("                         n                                                                          n \n");
        end
        
        fprintf("xn = ( ");
        fukusosuu_hyoji(lambda(1,1));
        fprintf(" ) �~ ( ");
        fukusosuu_hyoji(alpha(1));
        fprintf(" ) �~ ( ");
        fukusosuu_hyoji(P(1,1));
        fprintf(" ) �{ ( ");
        fukusosuu_hyoji(lambda(2,2));
        fprintf(" ) �~ ( ");
        fukusosuu_hyoji(alpha(2));
        fprintf(" ) �~ ( ");
        fukusosuu_hyoji(P(1,2));
        fprintf(" )");
        fprintf("\n\n\n");
    
        % ���Z
        fprintf(" n       �Q�����v�Z      ��ʍ��v�Z\n");
        for n = 0:10
           fprintf(" %2d %15.7g %15.7g\n", n, seq_n(n,c,x) ,lambda(1,1)^n * alpha(1) * P(1,1) + lambda(2,2)^n * alpha(2) * P(1,2));
        end
    case 'quit'
        disp('bye')

    otherwise
        disp('�s���ȃR�}���h�ł�')
        m %�ċA

end

% �����s��̃T�C�Y����͂����A���C���v�b�g���ďo�͂���
function A = input_A (input_size,str)

    if ne(strlength(str),1)
        fprintf("error: input size is not valid");
        return
    end

    fprintf("\n");

    % 2 * 2 �̐����s��̓���
    if input_size == 2
        A = zeros(2);
        fprintf(" %s = �@ �A\n     �B �C\n",str);

    % 3 * 3 �̐����s��̓���
    elseif input_size == 3
        A = zeros(3);
        fprintf(" %s = �@ �A �B\n     �C �D �E\n     �F �G �H\n",str);
    
    % 4 * 4 �̐����s��̓���
    elseif input_size == 4
        A = zeros(4);
        fprintf(" %s = �@ �A �B �C\n     �D �E �F �G\n     �H �I �J �K\n     �L �M �N �O\n",str);
    
    else
        fprintf("�����s��̃T�C�Y�͂Q���R���S�ɂ����Ή����Ă��܂���B\n\n");
        A = 'E';
        return
    end
    
    num = 1;

    for i=1 : input_size
        for p=1 : input_size
            fprintf("\n( %d )�̐��l����͂��Ă��������B",num);
            zeroni = input_repeat(0);
                if zeroni == 'E'
                    A = 'E';
                    return
                end
            A(i,p) = zeroni ;
            num = num + 1;
        end
    end
end

% �c�������̔z��
function XA = input_XA (input_size,str)

    if ne(strlength(str),1)
        fprintf("error 234");
        return
    end

    fprintf("\n");

    % 2 �� 
    if input_size == 2
        XA = zeros(2, 1);
        fprintf(" %s = �@\n     �A\n",str);
    
    % 3 �� 
    elseif input_size == 3
        XA = zeros(3, 1);
        fprintf(" %s = �@\n     �A\n     �B\n",str);
    
    % 4 �� 
    elseif input_size == 4
        XA = zeros(4, 1);
        fprintf(" %s = �@\n     �A\n     �B\n     �C\n",str);
    
    else
        fprintf("�x�N�g���̎����͂Q���R���S�ɂ����Ή����Ă��܂���B\n\n");
        XA = 'E';
        return
    end
    
    num = 1;

    for p=1 : input_size
        fprintf("\n( %d )�̐��l����͂��Ă�������",num);
        zeroni = input_repeat(0);
            if zeroni == 'E'
                XA = 'E';
                return
            end
        XA(p,1) = zeroni ;
        num = num + 1;
    end
end

% ��������s�̔z��
function XB = input_XB (input_size,str)

    if ne(strlength(str),1)
        fprintf("error 234");
        return
    end

    fprintf("\n");

    % 2 �s 
    if input_size == 2
        XB = zeros(1, 2);
        fprintf(" %s = �@ �A",str);

    % 3 �s 
    elseif input_size == 3
        XB = zeros(1, 3);
        fprintf(" %s = �@ �A �B",str);
    
    % 4 �s 
    elseif input_size == 4
        XB = zeros(1, 4);
        fprintf(" %s = �@ �A �B �C",str);
    
    else
        fprintf("�x�N�g���̎����͂Q���R���S�ɂ����Ή����Ă��܂���B\n\n");
        XB = 'E';
        return
    end
   
    num = 1;

    for p=1 : input_size
        fprintf("\n( %d )�̐��l����͂��Ă�������",num);
        zeroni = input_repeat(0);
            if zeroni == 'E'
                XB = 'E';
                return
            end
        XB(1,p) = zeroni ;
        num = num + 1;
    end
end

% �|���o���@
function X = Hakidashi(X,N)
    % N �� 2 �� 3
    
    Y = zeros(N);
    X = X * 0.00001 * 100000; % a�̗L�������𑵂���H

    for k = 1 : N
        l = k + 1;
        if k<N && round(X(k,k),5)==0
            v = 1; %d�s�ڂ�%d�s�ڂ����ւ���
            itijikansuu_print(X,k,l,0,0,v,N);
            for m=1 : N+1
                Y(k,m)=X(k,m);
                X(k,m)=X(l,m);
                X(l,m)=Y(k,m);
            end
        end
        piv = X(k,k);
        if ne(round(X(k,k),5),0) && ne(round(X(k,k),5),1)
        v = 2; %d�s�ڂ�%g�Ŋ����
        itijikansuu_print(X,k,l,piv,0,v,N);
        for j=k : N+1
            X(k,j)=X(k,j)/piv;
        end
        end
        
        for i = 1: N
            if ne(i,k) && ne(round(X(i,k),4),0) && ne(round(X(k,k),4),0)
                if round(X(i,k),4)==1
                    v = 3; %d�s�ڂ���%d�s�ڂ������@1�{�����Ȃ�����
                    itijikansuu_print(X,k,l,piv,i,v,N);
                else
                    v = 4; %d�s�ڂ���%g�{����%d�s�ڂ�����
                    itijikansuu_print(X,k,l,piv,i,v,N);
                end
                t=X(i,k);
                for j=k : N+1
                    X(i,j)=X(i,j)-t*X(k,j);
                end
            end
        end
    end
end

%�P���֐�
function itijikansuu_print(X,k,l,piv,i,v,N)
    
    ra = round(X,5);

    for m=1:N
        for q=1 : N+1
            if ra(m,q) == 0
                ra(m,q) = 0;
            end
        end
        switch N
            case 2
                fprintf("\n�@| %8.4G %8.4G | %8.4G |",ra(m,1),ra(m,2),ra(m,3));
            case 3
                fprintf("\n�@| %8.4G %8.4G %8.4G | %8.4G |",ra(m,1),ra(m,2),ra(m,3),ra(m,4));
        end
        if k == m
            switch k
                case 1
                    switch v
                    case 1
                        fprintf("�@%d�s�ڂ�%d�s�ڂ����ւ���",k,l);            
                    case 2
                        fprintf("�@%d�s�ڂ�%g�Ŋ����",k,round(piv,4));         
                    case 3
                        fprintf("�@%d�s�ڂ���%d�s�ڂ�����",i,k);
                    case 4
                        fprintf("�@%d�s�ڂ���%g�{����%d�s�ڂ�����",i,round(X(i,k),4),k);
                    end
                case 2
                    switch v
                    case 1
                        fprintf("�@%d�s�ڂ�%d�s�ڂ����ւ���",k,l);            
                    case 2
                        fprintf("�@%d�s�ڂ�%g�Ŋ����",k,round(piv,4));         
                    case 3
                        fprintf("�@%d�s�ڂ���%d�s�ڂ�����",i,k);
                    case 4
                        fprintf("�@%d�s�ڂ���%g�{����%d�s�ڂ�����",i,round(X(i,k),4),k);
                    end
                case 3
                    switch v
                    case 1
                        fprintf("�@%d�s�ڂ�%d�s�ڂ����ւ���",k,l);            
                    case 2
                        fprintf("�@%d�s�ڂ�%g�Ŋ����",k,round(piv,4));         
                    case 3
                        fprintf("�@%d�s�ڂ���%d�s�ڂ�����",i,k);
                    case 4
                        fprintf("�@%d�s�ڂ���%g�{����%d�s�ڂ�����",i,round(X(i,k),4),k);
                    end
            end
        end
    end
    fprintf("\n\n");
end

% �|���o���@(�����N)
function X = Hakidashi_seihou(X,N)
    % N �� 2 �� 3
    
    Y = zeros(N);
    X = X * 0.00001 * 100000; % a�̗L�������𑵂���H�i�΁j

    ra = round(X,5);
    
    switch N
        case 2
            fprintf("     | %8.4G %8.4G |\n",ra(1,1),ra(1,2));
            fprintf("     | %8.4G %8.4G |",ra(2,1),ra(2,2));
        case 3
            fprintf("     | %8.4G %8.4G %8.4G |\n",ra(1,1),ra(1,2),ra(1,3));
            fprintf("     | %8.4G %8.4G %8.4G |\n",ra(2,1),ra(2,2),ra(2,3));
            fprintf("     | %8.4G %8.4G %8.4G |",ra(3,1),ra(3,2),ra(3,3));
    end

    for k = 1 : N
        l = k + 1;
        if k<N && round(X(k,k),5)==0
            v = 1; %d�s�ڂ�%d�s�ڂ����ւ���
            RANK_hanbetu(X,k,l,0,0,v,N);
            for m=1 : N
                        %fprintf("i = %d\nm = %d",i,m);
                    Y(k,m)=X(k,m);
                    X(k,m)=X(l,m);
                    X(l,m)=Y(k,m);
            end
        end
        piv = X(k,k);
        if ne(round(X(k,k),5),0) && ne(round(X(k,k),5),1)
            v = 2; %d�s�ڂ�%g�Ŋ����
            RANK_hanbetu(X,k,l,piv,0,v,N);
            for j=k : N
                X(k,j)=X(k,j)/piv;
            end
        end
        
        for i = 1: N
            if ne(i,k) && ne(round(X(i,k),4),0) && ne(round(X(k,k),4),0)
                if round(X(i,k),4)==1
                    v = 3; %d�s�ڂ���%d�s�ڂ������@1�{�����Ȃ�����
                    RANK_hanbetu(X,k,l,piv,i,v,N);
                else
                    v = 4; %d�s�ڂ���%g�{����%d�s�ڂ�����
                    RANK_hanbetu(X,k,l,piv,i,v,N);
                end
                t=X(i,k);
                for j=k : N
                    X(i,j)=X(i,j)-t*X(k,j);
                end
            end
        end
    end

    fprintf("\n");

    ra = round(X,5);
    
    switch N
        case 2
            fprintf("     | %8.4G %8.4G |\n",ra(1,1),ra(1,2));
            fprintf("     | %8.4G %8.4G |",ra(2,1),ra(2,2));
        case 3
            fprintf("     | %8.4G %8.4G %8.4G |\n",ra(1,1),ra(1,2),ra(1,3));
            fprintf("     | %8.4G %8.4G %8.4G |\n",ra(2,1),ra(2,2),ra(2,3));
            fprintf("     | %8.4G %8.4G %8.4G |",ra(3,1),ra(3,2),ra(3,3));
    end
    fprintf("\n\n");
end

% �����N
function RANK_hanbetu(X,k,l,piv,i,v,N)
    
    ra = round(X,5);

    for m=1:N
        for q=1 : N
            if ra(m,q) == 0
                ra(m,q) = 0;
            end
        end
        switch N
            case 2
        fprintf("\n�@| %8.4G %8.4G |",ra(m,1),ra(m,2));
            case 3
        fprintf("\n�@| %8.4G %8.4G %8.4G |",ra(m,1),ra(m,2),ra(m,3));
        end
        if k == m
            switch k
                case 1
                    switch v
                    case 1
                        fprintf("�@%d�s�ڂ�%d�s�ڂ����ւ���",k,l);            
                    case 2
                        fprintf("�@%d�s�ڂ�%g�Ŋ����",k,round(piv,4));         
                    case 3
                        fprintf("�@%d�s�ڂ���%d�s�ڂ�����",i,k);
                    case 4
                        fprintf("�@%d�s�ڂ���%g�{����%d�s�ڂ�����",i,round(X(i,k),4),k);
                    end
                case 2
                    switch v
                    case 1
                        fprintf("�@%d�s�ڂ�%d�s�ڂ����ւ���",k,l);            
                    case 2
                        fprintf("�@%d�s�ڂ�%g�Ŋ����",k,round(piv,4));         
                    case 3
                        fprintf("�@%d�s�ڂ���%d�s�ڂ�����",i,k);
                    case 4
                        fprintf("�@%d�s�ڂ���%g�{����%d�s�ڂ�����",i,round(X(i,k),4),k);
                    end
                case 3
                    switch v
                    case 1
                        fprintf("�@%d�s�ڂ�%d�s�ڂ����ւ���",k,l);            
                    case 2
                        fprintf("�@%d�s�ڂ�%g�Ŋ����",k,round(piv,4));         
                    case 3
                        fprintf("�@%d�s�ڂ���%d�s�ڂ�����",i,k);
                    case 4
                        fprintf("�@%d�s�ڂ���%g�{����%d�s�ڂ�����",i,round(X(i,k),4),k);
                    end
            end
        end
    end
    fprintf("\n\n");
end

% �C���v�b�g���ċ󔒂Ȃ�3�����Ȃ�������
% 0:�����@1:����
function input_num = input_repeat(n)
    if n == 0
        input_num = input ('���@');
    else
        input_num = input ('���@','s');
    end
    for yycounter = 3 : -1 : 1
        if isempty(input_num) == true
        fprintf("��������Ȃ��Ⴞ�߂ł��I ����%d��P�\������܂��B",yycounter);
        input_num = input('�� ');
        end
    end
    if isempty(input_num) == true
         fprintf("���Ȃ����܂��B");
         input_num = 'E';
         return;
    end
end

% FIXME: �����N�������Ă���Ƃ��̔��ʂ��ԗ�����Ă��Ȃ��\���������ł��B
% �����s��̃����N���v�Z�A�������݂��邩�ǂ������o�͂���
function RANK_switch(seihou_X,X,N) 
    RANK = rank(seihou_X);
    [m,n] = size(seihou_X);
    if ne(m,n)
        fprintf("error RANK_switch�ɂ͐����s�񂵂����͂ł��Ȃ�");
        return
    end
    switch N
        case 2
                if RANK == 0
                    fprintf("�����N��%d�ŉ������݂��Ȃ��B��s��ł��B\n",RANK);
                elseif ne(RANK,N)
                    if X(2,3)==0
                        fprintf("�����N��%d��,���������ɑ��݂���B\n",RANK);
                    else
                        fprintf("�����N��%d�ŁA�������݂��Ȃ��B\n",RANK);
                    end
                else
                    fprintf("�����N��%d��,�B��������݂���B\n",RANK);
                end
        case 3
                if RANK == 0
                    fprintf("�����N��%d�ŉ������݂��Ȃ��B��s��ł��B\n",RANK);
                elseif ne(RANK,N)
                    if X(3,4)==0
                        fprintf("�����N��%d��,���������ɑ��݂���B\n",RANK);
                    else
                        fprintf("�����N��%d�ŁA�������݂��Ȃ��B\n",RANK);
                    end
                else
                    fprintf("�����N��%d��,�B��������݂���B\n",RANK);
                end
    end
end

% �Q�����Ɋ�Â�����̑悎���v�Z 
% x_{n+2} := c1 * x{n+1} c0 * x_n
function xn = seq_n(n,c,x)
    temp = [];
    temp(1) = x(1);
    temp(2) = x(2);

    if n == 0
        xn = temp(1);
    elseif n == 1
        xn = temp(2);
    else
        for i = 2:n
            xn = c(2) * temp(2) + c(1) * temp(1);
            temp(1) = temp(2);
            temp(2) = xn;
        end
    end
end
    
% �������{�����������������ŏo�͂��� 
function fukusosuu_hyoji(P)
    if imag(P) == 0
            fprintf("%6g",round(real(P),4));
    else
        if imag(P) < 0
            fprintf("%6g �[ %6gi",round(real(P),4),round(imag(P)*(-1),4));
        else
            fprintf("%6g �{ %6gi",round(real(P),4),round(imag(P),4));
        end
    end
end
