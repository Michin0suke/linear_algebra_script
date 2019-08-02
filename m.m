% ショートカット
e = exp(1);
% 複素数を変数とさせないため
clear i

disp("'li'と入力するとコマンド一覧を表示できます");
input_command = input('m > ','s');

switch input_command
    case 'li'
        disp(' ')
        fprintf("[ コマンド一覧 ]\n\n");
        fprintf("cmd:\tMATLABのコマンド一覧を表示\n");
        fprintf("inv:\t逆行列\n");
        fprintf("format:\tformat short / format long\n");
        fprintf("error:\t絶対誤差 / 相対誤差 / 有効桁数\n");
        fprintf("nerror:\tノルム絶対誤差 / 相対誤差 / 有効桁数\n");
        fprintf("basic:\t整数の足し算 / 引き算 / 掛け算 / 割り算\n");
        fprintf("normal:\t正規化\n");
        fprintf("normav:\t正規直交基底\n");
        fprintf("angle:\t二つのベクトルのなす角\n");
        fprintf("norm:\tノルム\n");
        fprintf("times:\t二つの配列 / ベクトルの掛け算\n");
        fprintf("gauss:\t一次連立方程式\n");
        fprintf("rank:\tランク\n");
        fprintf("sym:\t軸に対称なベクトル\n");
        fprintf("rotate:\t回転行列\n");
        fprintf("diagv:\t対角化可能と不可能の判別\n");
        fprintf("diag:\t対角化\n");
        fprintf("bde:\t基本変形行列\n");
        fprintf("gen:\t数列の一般項\n");
        fprintf("quit:\t終了\n\n");
        m %再帰
    case 'cmd'
        fprintf("MATLAB 関数一覧\n\n\n");
        fprintf("inv(A):\t\t逆行列\n\n");
        fprintf("rank(A):\t\tランク\n\n");
        fprintf("sqrt(n):\t平方根\n\n");
        fprintf("eig:\t\t固有値・固有ベクトル [V,λ] = eig(A)\n\n");
        fprintf("norm(A):\t絶対値\n\n");
        fprintf("det(A):\t\t行列式\n\n");
        fprintf("dot(x,y):\t\t内積\n\n");
        fprintf("eye(x,y):\t\t単位行列。eye(行数, 列数)\n\n");
        fprintf("zeros(x,y):\t\t零行列。zeros(行数, 列数)\n\n");
        fprintf("ones(x,y):\t\t全てが1の行列。ones(行数, 列数)\n\n");
        fprintf("rand(x,y):\t\t乱数行列。rand(行数, 列数)\n\n");
        fprintf("A.':\t\t転置（A'でもできるが、複素ベクトルを扱うときに問題がある）\n\n");
        fprintf("x .* A:\t\t要素それぞれにかける\n\n");
        fprintf("round():\t数値を丸める。√2を10桁に丸める例) round(sqrt(2), 10, 'significant')\n\n");
        m　%再帰

    case 'inv'
        % 正方行列のサイズの決定
        fprintf('正方行列の行数(=列数)を入力してください');

        input_size = input_repeat(0);
                if input_size == 'E'
                    return
                end

        V = input_A ( input_size ,"A");
        if V == 'E'
            return;
        end
        inv_V = inv(V);

        % 数式に複素数が含まれる場合
        if isreal(inv_V) == false
            fprintf('\n\n数式に複素数が含まれていたので縦書きで表示されます\n\n');
            disp(' ');
            fprintf('\n V ^(-1) ＝ \n\n');
            disp(inv(V));
            disp(' ');
            return;
        end

        fprintf('\n \n\n');
        yoko = 1; sita = 1;

        % ディスプレイ用に転置しないといけないと思い込んでいた時期がありました。
        DISP_inv_V = inv_V.';
        DISP_inv_V = round( DISP_inv_V , 5);
        % なぜか -0 と表示されるのがきもちわるいので
        for i=1 : input_size^2
            if DISP_inv_V(i) == 0
                DISP_inv_V(i) = 0;
            end
        end

        % 対角化できないときの処理
        if det(round(V,8)) == 0  %　行列式＝0　→　正則でない　→　対角化できない
            if input_size == 2
            fprintf(" V = | %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita));
            fprintf("     | %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1));
            fprintf("固有ベクトルを並べて作った行列 V = [v1 v2] は正則でないので、対角化不可能。\n");
            elseif input_size == 3
            fprintf("     | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita),  DISP_inv_V(yoko+2,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1),DISP_inv_V(yoko+2,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+2),DISP_inv_V(yoko+1,sita+2),DISP_inv_V(yoko+2,sita+2));
            fprintf("固有ベクトルを並べて作った行列 V = [v1 v2 v3] は正則でないので、対角化不可能。\n");
            elseif input_size == 4
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita),  DISP_inv_V(yoko+2,sita),  DISP_inv_V(yoko+3,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+1),  DISP_inv_V(yoko+1,sita+1),  DISP_inv_V(yoko+2,sita+1),  DISP_inv_V(yoko+3,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+2),  DISP_inv_V(yoko+1,sita+2),  DISP_inv_V(yoko+2,sita+2),  DISP_inv_V(yoko+3,sita+2));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+3),  DISP_inv_V(yoko+1,sita+3),  DISP_inv_V(yoko+2,sita+3),  DISP_inv_V(yoko+3,sita+3));
            fprintf("固有ベクトルを並べて作った行列 V = [v1 v2 v3 v4] は正則でないので、対角化不可能。\n");
            end
            disp(' ');
            fprintf("正方行列 A の固有ベクトルを並べて作った行列 V の行列式 ＝ 0\n　　→ 行列 V は正則でない\n　　→ 正方行列 A は対角化できない");
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
        a=input('真値 > ');
        b=input('近似値 > ');
        disp(' ')
        ab_error = abs(a-b);
        disp('絶対誤差:')
        disp(ab_error)
        re_error = ab_error / abs(a);
        disp('相対誤差:')
        disp(re_error)
        keta = -log10(re_error);
        disp('有効桁数:')
        disp(keta)

    case 'nerror'
        a=input('真値 > ');
        b=input('近似値 > ');
        disp(' ')
        abs_error_1 = norm(a-b, 1);
        abs_error_2 = norm(a-b);
        abs_error_inf = norm(a-b, 'inf');
        abs_error_fro = norm(a-b, 'fro');
        disp('ノルム絶対誤差(1ノルム):')
        disp(abs_error_1)
        disp('ノルム絶対誤差(ユークリッドノルム):')
        disp(abs_error_2)
        disp('ノルム絶対誤差(無限大ノルム):')
        disp(abs_error_inf)
        disp('ノルム絶対誤差(Frobeniusノルム):')
        disp(abs_error_fro)
        disp(' ')
        rel_error_1 = abs_error_1 / norm(a, 1);
        rel_error_2 = abs_error_2 / norm(a);
        rel_error_inf = abs_error_inf / norm(a, 'inf');
        rel_error_fro = abs_error_fro / norm(a, 'fro');
        disp('ノルム相対誤差(1ノルム):')
        disp(rel_error_1)
        disp('ノルム相対誤差(ユークリッドノルム):')
        disp(rel_error_2)
        disp('ノルム相対誤差(無限大ノルム):')
        disp(rel_error_inf)
        disp('ノルム相対誤差(Frobeniusノルム):')
        disp(rel_error_fro)

    case 'basic'
        a = input('a > ');
        b = input('b > ');
        fprintf("%d + %d = %d\n",a,b,a+b);
        fprintf("%d - %d = %d\n",a,b,a-b);
        fprintf("%d × %d = %d\n",a,b,a*b);
        fprintf("%d ÷ %d = %d\n",a,b,a/b);

    case 'normal'
        fprintf("正規化したい X ベクトルの次元数を入力してください。今は３だけ");
        N = input_repeat(0);
        if N == 'E'
            return
        end
        X = input_XA(N,"X");
        if X == 'E'
            return
        end
        fprintf('\n  \n\n');
        fprintf(" ||X|| = %Gより、X を正規化したベクトル Y は、\n\n",norm(X));
        fprintf("         1          1  |%3.2G |     |%6.4G |\n",X(1,1),X(1,1)/norm(X));
        fprintf(" Y  =  ━━━━ X  =  ━━━━ |%3.2G |  =  |%6.4G |\n",X(2,1),X(2,1)/norm(X));
        fprintf("       ||X||      %5.3G|%3.2G |     |%6.4G |\n\n",norm(X),X(3,1),X(3,1)/norm(X));
        fprintf('\n  \n\n');

    case 'normav'
        N = input('正規化したい X ベクトルの次元数を入力してください。(2 or 3) > ');
        if ne(N, 3) && ne(N, 2)
            disp('error: 次元数には2か3にしか対応していません。')
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
        fprintf(" ||a|| = %Gより、a を正規化したベクトル u は、\n\n",norm(u));
        fprintf("         1          a     \n");
        fprintf(" u  =  ━━━━ a  =  ━━━━    \n");
        fprintf("       ||a||(2)   ||a||(2)  \n\n\n");
        switch N
            case 2
                fprintf("         1          1                       \n");
                fprintf(" u  =  ━━━━ a  =  ━━━━ |%3.2G |  =  |%6.4G |\n",a(1,1),a(1,1)/norm(a));
                fprintf("       ||a||      %5.3G|%3.2G |     |%6.4G |\n\n",norm(a),a(2,1),a(2,1)/norm(a));
            case 3
                fprintf("         1          1  |%3.2G |     |%6.4G |\n",a(1,1),a(1,1)/norm(a));
                fprintf(" u  =  ━━━━ a  =  ━━━━ |%3.2G |  =  |%6.4G |\n",a(2,1),a(2,1)/norm(a));
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
                fprintf(" v   =  ━━━━━━━  \n");
                fprintf("         %6.4G   \n\n", norm(V));
            case 3
                fprintf("        |%6.4G | \n", V(1));
                fprintf("        |%6.4G | \n", V(2));
                fprintf("        |%6.4G | \n", V(3));
                fprintf(" v   =  ━━━━━━━  \n");
                fprintf("         %6.4G   \n\n", norm(V));
        end
        disp(' u = ')
        disp(u)
        disp(" v' = ")
        disp(V)
        disp(" v = ")
        disp(v)

    case 'angle'
        fprintf("ベクトル X の次元数を入力してください");
        n = input_repeat(0);
        if n == 'E'
            return
        end
        fprintf(" X ベクトルを入力してください\n");
        X = input_XA(n,"X");
            if X == 'E'
            return
            end
        fprintf(" Y ベクトルを入力してください\n");
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
                    fprintf(" %G × %G ",X(i,1),Y(i,1));
                    if i == n
                        fprintf("＝ %G\n\n",X(1,1)*Y(1,1)+X(2,1)*Y(2,1));
                    else
                    fprintf("＋");
                    end
                end
                fprintf(" 　||X|| ＝ %0.3f \n",norm(X));
                fprintf(" 　||Y|| ＝ %0.3f \n\n",norm(Y));
                fprintf("ここで ( X , Y ) ＝ ||X|| ||Y||cosθより、\n\n");
                fprintf(" 　cosθ ＝ %0.3f \n\n",cos_theta);
                fprintf("        ( X , Y )     -1    \n");
                fprintf(" θ ＝ - cos      \n");
                fprintf("       ||X|| ||Y||          \n\n");
                fprintf(" θ ＝ %f\n\n",theta);
                fprintf("X = |%3G | と Y =|%3G | がなす角θは %3G です。\n" ,X(1,1),Y(1,1),theta);
                fprintf("    |%3G |       |%3G |\n"                         ,X(2,1),Y(2,1));
            case 3
                fprintf(" ( X , Y ) =");
                for i = 1 : n
                    fprintf(" %G × %G ",X(i,1),Y(i,1));
                    if i == n
                        fprintf("＝ %G\n\n",X(1,1)*Y(1,1)+X(2,1)*Y(2,1)+X(3,1)*Y(3,1));
                    else
                    fprintf("＋");
                    end
                end
                fprintf(" 　||X|| ＝ %0.3f \n",norm(X));
                fprintf(" 　||Y|| ＝ %0.3f \n\n",norm(Y));
                fprintf(" θ ＝ %f\n\n",theta);
                fprintf("ここで ( X , Y ) ＝ ||X|| ||Y||cosθより、\n\n");
                fprintf("        ( X , Y )     -1    \n");
                fprintf(" θ ＝ - cos      \n");
                fprintf("       ||X|| ||Y||          \n\n");
                fprintf(" 　cosθ ＝ %0.3f \n\n",cos_theta);
                
                fprintf("    | %3G |       | %3G |\n"                         ,X(1,1),Y(1,1));
                fprintf("X = | %3G | と Y =| %3G | がなす角θは %3G です。\n" ,X(2,1),Y(2,1),theta);
                fprintf("    | %3G |       | %3G |\n"                         ,X(3,1),Y(3,1));
            case 4
                fprintf(" ( X , Y ) =");
                for i = 1 : n
                    fprintf(" %G × %G ",X(i,1),Y(i,1));
                    if i == n
                        fprintf("＝ %G\n\n",X(1,1)*Y(1,1)+X(2,1)*Y(2,1)+X(3,1)*Y(3,1));
                    else
                    fprintf("＋");
                    end
                end
                fprintf(" 　||X|| ＝ %0.3f \n",norm(X));
                fprintf(" 　||Y|| ＝ %0.3f \n\n",norm(Y));
                fprintf("ここで ( X , Y ) ＝ ||X|| ||Y||cosθより、\n\n");
                fprintf(" 　cosθ ＝ %0.3f \n\n",cos_theta);
                fprintf("        ( X , Y )     -1    \n");
                fprintf(" θ ＝ - cos      \n");
                fprintf("       ||X|| ||Y||          \n\n");
                fprintf(" θ ＝ %f\n\n",theta);
                fprintf("    |%3G |       |%3G |\n"                         ,X(1,1),Y(1,1));
                fprintf("X = |%3G | と Y =|%3G | がなす角θは %3G です。\n" ,X(2,1),Y(2,1),theta);
                fprintf("    |%3G |       |%3G |\n"                         ,X(3,1),Y(3,1));
                fprintf("    |%3G |       |%3G |\n"                         ,X(4,1),Y(4,1));
            otherwise
                fprintf("ERROR");
        end
        fprintf('\n \n');
        fprintf("〈ポイント〉Xはxベクトル、Yはyベクトルを表しています\n");
    case 'norm'
        a = input('a > ');
        fprintf("||a||\t\t= %f（ユークリッドノルム。||a||(2)とも。）\n",norm(a));
        fprintf("||a||(1)\t= %f\n",norm(a,1));
        fprintf("||a||(∞)\t= %f\n",norm(a,'inf'));
        fprintf("||a||(f)\t= %f（Frobeniusノルム。）\n",norm(a,'fro'));
    case 'times'
        fprintf("         配列タイプ一覧  \n");
        fprintf(" |                                                | \n");
        fprintf(" |   ①＝|〇|     ②＝|〇|       ③＝|〇|          | \n");
        fprintf(" |       |〇|         |〇|           |〇|         | \n");
        fprintf(" |                    |〇|           |〇|         | \n");
        fprintf(" |                                   |〇|         | \n");
        fprintf(" |                                                | \n");
        fprintf(" |   ④＝|〇〇|   ⑤＝|〇〇〇|   ⑥＝|〇〇〇〇|    | \n");
        fprintf(" |                                                | \n");
        fprintf(" |   ⑦＝|〇〇|   ⑧＝|〇〇〇|   ⑨＝|〇〇〇〇|    | \n");
        fprintf(" |       |〇〇|       |〇〇〇|       |〇〇〇〇|   | \n");
        fprintf(" |                    |〇〇〇|       |〇〇〇〇|   | \n");
        fprintf(" |                                   |〇〇〇〇|   | \n");
        fprintf(" |                                                | \n");
        fprintf("         \n\n");

        fprintf("\n掛け算する左側の配列のタイプをおしえてください");
        fprintf("\n\n 〇×〇\n ↑ こっち");
        first_array = input_repeat(0);
        if first_array == 'E'
            A = 'E';
            return
        end
        fprintf("\n\n掛け算する右側の配列のタイプをおしえてください");
        fprintf("\n\n(%d)×〇\n     ↑ こっち",first_array);
        second_array = input_repeat(0);
        if second_array == 'E'
            A = 'E';
            return
        end
        fprintf("\n\n(%d)×(%d)\n\n",first_array,second_array);
        % 計算できない場合       
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
            fprintf("配列のタイプは１～９にしか対応していません。");
            return
        end
        if ne(length,height)
            fprintf('\n     -\n');
            fprintf("\n 選んだタイプは %d と %d ですが、左の配列が%d列なのに対し、右の配列が%d行であるので", first_array, second_array, length, height);
            fprintf("\n 左側の配列の列数（横の長さ）と右側の配列の行数（縦の長さ）が違うので計算できません。\n");
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
        fprintf("         ×\n\n");
        disp(second_array);
        fprintf("         ||\n\n");
        disp(first_array * second_array);
        fprintf('        \n\n');

    case 'gauss'
        fprintf("正方行列 A の行数(=列数)を入力してください\n現状は２、３にしか対応していません。");
        N = input_repeat(0);
        if N == 'E'
            return
        end
        if ne(N,2) && ne(N,3)
            fprintf("正方行列のサイズは２か３にしか対応してません。ごめんなさい( TДT)ｺﾞﾒﾝﾖｰ \n\n")
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
            X = Hakidashi(X,N); % 掃き出し関数の方で導出部の出力は完了する。
        fprintf('\n        \n\n');

        v = 0;
        itijikansuu_print(X,0,0,0,i,v,N);
        RANK_switch(seihou_X,X,N);

    case 'sym'
        fprintf("対称移動させたい X ベクトルの次元数を入力してください。\n現状は２次元または３次元ベクトルにしか対応していません。");
        input_size = input_repeat(0);
        if input_size == 'E'
            return
        end
        if ne(input_size,2)&&ne(input_size,3)
            fprintf("ベクトルのサイズは２か３にしか対応してません。\nごめんね( TДT)ｺﾞﾒﾝﾖｰ\n");
            return
        end
        fprintf(" X ベクトルを入力してください\n");
        X = input_XA ( input_size ,"X");
        if X == 'E'
            return
        end
        [p,n] = size(X);
        fprintf("何に対して対称にしますか？\n");
        fprintf("〈選択肢〉　x1 : x1軸(x軸)対称\n");
        fprintf("　　　　　　x2 : x2軸(y軸)対称\n");
        fprintf("　　　　　　x3 : x3軸(z軸)対称（ベクトルの次元が３のとき限定）\n");
        fprintf("　　　　　　genten : 原点対称\n");
        for i=1:3
        x1orx2 = input_repeat(1);
        if x1orx2 == 'E'
            return
        end
        if x1orx2 == "x1" || x1orx2 == "x2" || x1orx2 == "x3" || x1orx2 == "genten"
            break
        elseif i == 3
            fprintf("やりなおしてください。ごめんね。");
            return
        else
            fprintf(" x1 , x2 , x3 , genten のいずれかを入力してください。");
        end
        end
        switch x1orx2
            case "x1"
                x_num = 1;
                jiku = "x1軸";
            case "x2"
                x_num = 2;
                jiku = "x2軸";
            case "x3"
                if ne(input_size,3)
                    fprintf("x3軸対称は３次元ベクトルでないとできません");
                    return
                end
                x_num = 3;
                jiku = "x3軸";
            case "genten"
                x_num = 0;
                jiku = "原点";
            otherwise
                fprintf("error 3");
                return
        end
        XX = zeros (input_size,1);
        M = eye (input_size);
        for i=1 : p
            if ne(i,x_num)              % Xを上から見て行って、yだったら２個目以外をマイナスに。
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
                fprintf("%sに対して対称なベクトルX'は、\n\n",jiku);
                fprintf("X'= |%3G |\n",XX(1,1));
                fprintf("    |%3G |\n\n",XX(2,1));
                fprintf("また、X'＝ MX となる２次正方行列 M は、\n\n");
                fprintf(" |%3G | ＝ M |%3G |\n",XX(1,1),X(1,1));
                fprintf(" |%3G |      |%3G |\n\n",XX(2,1),X(2,1));
                fprintf("となるので、\n\n");
                fprintf("M = |%3G %3G|\n",M(1,1),M(1,2));
                fprintf("    |%3G %3G|\n",M(2,1),M(2,2));
            case 3
                fprintf("    |%3G |\n",X(1,1));
                fprintf("X = |%3G |\n",X(2,1));
                fprintf("    |%3G |\n",X(3,1));
                fprintf('\n        \n\n');
                fprintf("%sに対して対称なベクトルX'は、\n\n",jiku);
                fprintf("    |%3G |\n",XX(1,1));
                fprintf("X'= |%3G |\n",XX(2,1));
                fprintf("    |%3G |\n\n",XX(3,1));
                fprintf("また、X'＝ MX となる２次正方行列 M は、\n\n");
                fprintf(" |%3G |      |%3G |\n",XX(1,1),X(1,1));
                fprintf(" |%3G | ＝ M |%3G |\n",XX(2,1),X(2,1));
                fprintf(" |%3G |      |%3G |\n\n",XX(3,1),X(3,1));
                fprintf("となるので、\n\n");
                fprintf("    |%3G %3G %3G|\n",M(1,1),M(1,2),M(1,3));
                fprintf("M = |%3G %3G %3G|\n",M(2,1),M(2,2),M(2,3));
                fprintf("    |%3G %3G %3G|\n",M(3,1),M(3,2),M(3,3));
        end
        fprintf('\n        \n');
        fprintf("〈ポイント〉\nxn軸に対称なベクトルX'は、Xのn番目以外のすべての要素をマイナスにすればいいよ！\n");
        fprintf("例えば、x1軸に対称なベクトルX'を求めたいなら、一番上以外の要素にすべて-1をかければいいわけです\n");

    case 'rotate'
        fprintf("\n回転させたいベクトル X を入力してください\n");
        X = input_XA ( 2 ,"X");
        if X == 'E'
            return
        end
        fprintf("\n\n X = |%3G |\n     |%3G |\n\n",X(1,1),X(2,1));
        fprintf(" X ベクトルを回転させる角度を入力してください。\n(π/5 のような数値は 180/5 のようにπを180に変換して入力してください)");
        r = input_repeat(0);
        if r == 'E'
            return
        end
        R = [cosd(r) -sind(r) ; sind(r) cosd(r)];
        Answer = R * X;
        fprintf("\n\n X = |%3G | を %G°回転させると、\n     |%3G |\n",X(1,1),r,X(2,1));
        fprintf('\n           \n\n');
        fprintf(" R(%4G ) X ＝ | cos( %G ) -sin( %G ) | |%3G | ＝ | %6G %6G | |%3G | ＝ |%7G |\n",r,r,r,X(1,1),round(cosd(r),3),round(-sind(r),3),X(1,1),round(Answer(1,1),4));
        fprintf("               | sin( %G )  cos( %G ) | |%3G |    | %6G %6G | |%3G |    |%7G |\n",r,r,X(2,1),round(sind(r),3),round(cosd(r),3),X(2,1),round(Answer(2,1),4));
        fprintf('\n           \n\n');
    
    case 'diagv'
        fprintf("正方行列 A の行数(=列数)を入力してください\n現状 2 にしか対応していません。");
        N = input_repeat(0);
        if N == 'E'
            return
        end
        if N == 3
            fprintf("3×3の正方行列の対角化可能性の判別は複雑なので現状対応していません。");
            twitter();
            return;
        end
        if ne(N,2) && ne(N,3)
            fprintf("ベクトルの次元は２にしか対応してません。");
            return
        end
         A = input_A(N,"A");
        if A == 'E'
            return
        end
        fprintf("\n");
        fprintf("正方行列 A が対角化可能かどうかを「固有値」「固有ベクトル」「ランク」という言葉を使って説明する。\n");
        fprintf('\n           \n\n');
        switch N
            case 2
            fprintf(" A = | %3G %3G |\n",A(1,1),A(1,2));
            fprintf("     | %3G %3G |\n\n",A(2,1),A(2,2));
                
            fprintf(" | A - λI | = 0 \n\n");
            fprintf(" | %3G-λ %5G | = 0\n",A(1,1),A(1,2));
            fprintf(" | %5G %3G-λ |\n\n",A(2,1),A(2,2));
            DISP_A = round(A,3);
            
            [P,lambda] = eig(A);
            P = round(P, 12);
            lambda = eig(A);
            
            if A(1,1) == 0 && A(2,2) == 0
                    fprintf(" λ- ",A(1,1),A(2,2));
                elseif A(1,1) == 0
                    fprintf(" -λ( %G-λ ) ",A(2,2));
                elseif A(2,2) == 0
                    fprintf(" -λ( %G-λ ) ",A(1,1));
                elseif A(1,1) == A(2,2)
                    fprintf("           2\n");
                    fprintf(" (%3G - λ ) ",A(1,1));
                elseif ne(A(1,1),0) && ne(A(2,2),0)
                    fprintf(" ( %G-λ )( %G-λ ) ",A(1,1),A(2,2));
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
            
            % 重解の場合
            if round(lambda(1,1),8) == round(lambda(2,1),8)
                lam_A_rank=0;
                
                kai = "のみの重解";
                fprintf("λ = %G \n\n",lambda(1,1));

                fprintf("したがってAの固有値は%G%s。\n",lambda(1,1),kai);
                fprintf("固有値が重解である場合は、固有ベクトルを任意に並べて作った行列 P が正則になれば対角化可能である。\n");
                fprintf(" P = [ v1 v2 ] とすると、\n\n");
                v = 0;
                Hakidashi_seihou(P,N);
                fprintf(" rank( P ) = %d\n",rank(P));
                
                if rank(P) == N
                    fprintf("　 → P がフルランクである。\n");
                    fprintf("　 → P は正則である。\n\n");
                    fprintf("よって P が正則になるように固有ベクトルをとることができるので、A は対角化可能である。\n");
                    disp(' ')
                    fprintf(" Λ = | %3G   0 |\n"  ,lambda(1,1));
                    fprintf("     |   0 %3G |\n\n",lambda(2,1));
                else
                    fprintf(" 　→ P がランク落ちしている。\n");
                    fprintf("　 → P は正則でない。\n\n");
                    fprintf("よって P が正則になるように固有ベクトルをとることができないので、A は対角化不可能である。\n");
                    disp(' ')
                    fprintf(" J = | %3G   1 |\n"  ,lambda(1,1));
                    fprintf("     |   0 %3G | （ジョルダン標準形）\n\n",lambda(2,1));
                end
            % 異なる二つの固有値
            else
                lam_A_rank=1;
                
                kai = "で、異なる二つの固有値を持つ";
                
                fprintf("λ = %G , %G \n\n",lambda(1,1),lambda(2,1));
                fprintf("したがってAの固有値は%Gと%G%s。\n",lambda(1,1),lambda(2,1),kai);
                fprintf("正方行列 A が異なる n 個の固有値を持つとき、ランク等にかかわらず A は必ず対角化できる。\n");
                disp(' ')
                fprintf(" Λ = | %3G   0 |\n"  ,lambda(1,1));
                fprintf("     |   0 %3G |\n\n",lambda(2,1));
            end
        end

        fprintf('\n           \n\n');
        fprintf("〈注意〉\n");
        fprintf("固有値がλ=-1,-1のように表示されているのに、異なる二つの固有値と表示されることがあります。\n");
        fprintf("〈ポイント〉\n");
        fprintf("レポートの回答では ( A - λI ) のランクを求めていましたが、求めるまでもなく ( A - λI ) は必ずランク落ちします。\n");
        fprintf("固有方程式  | A - λI | V ＝ 0 で考えてみると簡単で、rank ( A - λI ) ＝ n になる（フルランクになる）ということは、\n");
        fprintf("すなわち V ＝ 0 にならなければ固有方程式が成り立たないことになります。\n");
        fprintf("固有値 λ に対応する零ベクトル以外の V は必ず存在するので、rank ( A - λI ) ＝ n となることはあり得ないということです。\n");
        fprintf("参考までに以下が ( A - λI ) のランクです。\n\n");
        
        switch lam_A_rank
            case 0
                af_lam_A = [A(1,1)-lambda(1,1),A(1,2);A(2,1),A(2,2)-lambda(1,1)];
                RANK = rank(af_lam_A);
                fprintf("rank(A-λI) = %G\n\n",RANK);
            case 1
                lam_A_1 = [A(1,1)-lambda(1,1),A(1,2);A(2,1),A(2,2)-lambda(1,1)];
                lam_A_2 = [A(1,1)-lambda(2,1),A(1,2);A(2,1),A(2,2)-lambda(2,1)];
                RANK1 = rank(lam_A_1);
                RANK2 = rank(lam_A_2);
                fprintf("λ = %Gのとき\n",lambda(1,1));
                fprintf("rank(A-λI) = %G\n\n",RANK1);
                fprintf("λ = %Gのとき\n",lambda(2,1));
                fprintf("rank(A-λI) = %G\n\n",RANK2);
        end

    case 'diag'
        fprintf("Aを入力するとAの対角化をしてくれるよ！\n\n");

        % 正方行列のサイズの決定
        fprintf('正方行列の行数(=列数)を入力してください');

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

        % 数式に複素数が含まれる場合 
        if isreal(A) == false || isreal(V) == false || isreal(inv_V) == false || isreal(Answer) == false
            fprintf('\n\n数式に複素数が含まれていたので縦書きになったよ！\n見にくくてごめんね(>_<)\n\n');
            disp('        ');
            fprintf('\n V ^(-1) × A × V ＝ \n\n');
            disp(inv(V));fprintf("          ×\n\n");disp(A);fprintf("          ×\n\n");disp(V);fprintf("          ||\n\n");
            disp( V \ A * V);
            disp('        ');
            return;
        end

        fprintf('\n        \n\n');

        % fprintf('V ^(-1) × A × V = \n\n');
        yoko = 1; sita = 1;

        % if V(1,1)*V(2,2)-V(1,2)*V(2,1) == 0

        % ディスプレイ用に転置しないといけないと思っていた。
        DISP_V = V.';
        DISP_inv_V = inv_V.';
        DISP_A = A.';
        DISP_Answer = Answer.';
        % 指数表示とかが面倒なので、小数点以下を丸めます。
        DISP_V = round( DISP_V , 5);
        DISP_inv_V = round( DISP_inv_V , 5);
        DISP_A = round( DISP_A , 5);
        DISP_Answer = round( DISP_Answer , 5);

        % なぜか -0 と表示されるのがきもちわるいので0 に変換する。
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

        % 対角化できないときの処理  
        if det(round(V,8)) == 0  %　行列式＝0　→　正則でない　→　対角化できない
            if input_size == 2
            fprintf(" V = | %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita));
            fprintf("     | %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+1),DISP_V(yoko+1,sita+1));
            fprintf("固有ベクトルを並べて作った行列 V = [v1 v2] は正則でないので、対角化不可能。\n");
            elseif input_size == 3
            fprintf("     | %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita),  DISP_V(yoko+2,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+1),DISP_V(yoko+1,sita+1),DISP_V(yoko+2,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+2),DISP_V(yoko+1,sita+2),DISP_V(yoko+2,sita+2));
            fprintf("固有ベクトルを並べて作った行列 V = [v1 v2 v3] は正則でないので、対角化不可能。\n");
            elseif input_size == 4
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita),  DISP_V(yoko+2,sita),  DISP_V(yoko+3,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+1),  DISP_V(yoko+1,sita+1),  DISP_V(yoko+2,sita+1),  DISP_V(yoko+3,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+2),  DISP_V(yoko+1,sita+2),  DISP_V(yoko+2,sita+2),  DISP_V(yoko+3,sita+2));
            fprintf("     | %10.5G %10.5G %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+3),  DISP_V(yoko+1,sita+3),  DISP_V(yoko+2,sita+3),  DISP_V(yoko+3,sita+3));
            fprintf("固有ベクトルを並べて作った行列 V = [v1 v2 v3 v4] は正則でないので、対角化不可能。\n");
            end
            disp('        ');
            fprintf("正方行列 A の固有ベクトルを並べて作った行列 V の行列式 ＝ 0\n　　→ 行列 V は正則でない\n　　→ 正方行列 A は対角化できない");
            return;
        end
        if input_size == 2
            fprintf(" V = | %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita));
            fprintf("     | %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+1),DISP_V(yoko+1,sita+1));
            fprintf("  -1\n");
            fprintf(" V = | %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita));
            fprintf("     | %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1));
            fprintf('            V ^(-1)         ×       A       ×              V              ＝ \n\n');
            fprintf(" | %10.5G %10.5G |  ×  | %3G %3G |  ×  | %10.5G %10.5G |  ＝  | %10.5G %10.5G |　\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G |     | %3G %3G |     | %10.5G %10.5G |      | %10.5G %10.5G |　\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita));
            disp('                                                                              ~~~~~~~~~~~~~~~~~~~~~~~~~');
        elseif input_size == 3
            fprintf("     | %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita),  DISP_V(yoko+1,sita),  DISP_V(yoko+2,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G |\n"    ,DISP_V(yoko,sita+1),DISP_V(yoko+1,sita+1),DISP_V(yoko+2,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G |\n\n\n",DISP_V(yoko,sita+2),DISP_V(yoko+1,sita+2),DISP_V(yoko+2,sita+2));
            fprintf("  -1 | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita),  DISP_inv_V(yoko+1,sita),  DISP_inv_V(yoko+2,sita));
            fprintf(" V = | %10.5G %10.5G %10.5G |\n"    ,DISP_inv_V(yoko,sita+1),DISP_inv_V(yoko+1,sita+1),DISP_inv_V(yoko+2,sita+1));
            fprintf("     | %10.5G %10.5G %10.5G |\n\n\n",DISP_inv_V(yoko,sita+2),DISP_inv_V(yoko+1,sita+2),DISP_inv_V(yoko+2,sita+2));
            fprintf('                 V ^(-1)               ×         A         ×                    V                   ＝ \n\n');
            fprintf(" | %10.5G %10.5G %10.5G |     | %3G %3G %3G |     | %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G |　\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G |  ×  | %3G %3G %3G |  ×  | %10.5G %10.5G %10.5G |  ＝  | %10.5G %10.5G %10.5G |　\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G |     | %3G %3G %3G |     | %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G |　\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita));
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
            fprintf('                       V ^(-1)                    ×           A           ×                         V                         ＝ \n\n');
            fprintf(" | %10.5G %10.5G %10.5G %10.5G |     | %3G %3G %3G %3G |     | %10.5G %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G %10.5G |　\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_inv_V(yoko+3,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_A(yoko+3,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_V(yoko+3,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita),DISP_Answer(yoko+3,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G %10.5G |  ×  | %3G %3G %3G %3G |  ×  | %10.5G %10.5G %10.5G %10.5G |  ＝  | %10.5G %10.5G %10.5G %10.5G |　\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_inv_V(yoko+3,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_A(yoko+3,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_V(yoko+3,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita),DISP_Answer(yoko+3,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G %10.5G |     | %3G %3G %3G %3G |     | %10.5G %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G %10.5G |　\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_inv_V(yoko+3,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_A(yoko+3,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_V(yoko+3,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita),DISP_Answer(yoko+3,sita));
            sita = sita + 1 ;
            fprintf(" | %10.5G %10.5G %10.5G %10.5G |     | %3G %3G %3G %3G |     | %10.5G %10.5G %10.5G %10.5G |      | %10.5G %10.5G %10.5G %10.5G |　\n",DISP_inv_V(yoko,sita),DISP_inv_V(yoko+1,sita),DISP_inv_V(yoko+2,sita),DISP_inv_V(yoko+3,sita),DISP_A(yoko,sita),DISP_A(yoko+1,sita),DISP_A(yoko+2,sita),DISP_A(yoko+3,sita),DISP_V(yoko,sita),DISP_V(yoko+1,sita),DISP_V(yoko+2,sita),DISP_V(yoko+3,sita),DISP_Answer(yoko,sita),DISP_Answer(yoko+1,sita),DISP_Answer(yoko+2,sita),DISP_Answer(yoko+3,sita));
            disp('                                                                                                                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
        end
        disp('        ');

    case 'bde'
        fprintf("i行目とj行目を入れ替える\tP(i,j)\n\n");
        fprintf("i行目の成分を全てc倍する\tQ(i; c)\n\n");
        fprintf("i行目にj行目のc倍を加える\tR(i,j;c)\n\n");

    case 'gen'
        % x_{n+2} := c1 * x_{n+1} + c0 * x_n
        fprintf("x_{n+2}  :=  c1  ×  x_{n+1}  ＋  c0  ×  x_n\n\n");
        % c = [co; c1]
        fprintf("                                  ↑");
        fprintf("　c0 を入力してください\n");
        c0 = input_repeat(0);
        if c0 == 'E'
                return
        end
        
        fprintf("\n");
        fprintf("x_{n+2}  :=  c1  ×  x_{n+1}  ＋  %G  ×  x_n\n\n",c0);
        fprintf("             ↑");
        fprintf("　c1 を入力してください\n");
        c1 = input_repeat(0);
        if c1 == 'E'
                return
        end
        
        fprintf("\n");
        fprintf("x_{n+2}  :=  %G  ×  x_{n+1}  ＋  %G  ×  x_n\n\n",c1,c0);
    
        % 初期値
        % x = [x0; x1]
        fprintf("　x0 を入力してください\n");
        x0 = input_repeat(0);
        if x0 == 'E'
                return
        end
        fprintf("　x1 を入力してください\n");
        x1 = input_repeat(0);
        if x1 == 'E'
                return
        end
        % x0 = 0; x1 = 1;
    
        % 数列
        c = [c0; c1];
        x = [x0; x1];
        
        fprintf("\n");
        
        % fprintf("漸化式：x_{n+2} := (%g) * x_{n+1} + (%g) * x_n\n\n",c(2), c(1));
        fprintf("漸化式：x_{n+2}  :=  %G  ×  x_{n+1}  ＋  %G  ×  x_n\n\n",c1,c0);
        fprintf("初期値：x_0 = %g\n",x(2));
        fprintf("        x_1 = %g\n\n",x(2));
    
        % Companion Matrix
        C = [0,1;c(1),c(2)];
        disp("C = "); disp(C);
    
        [P,lambda] = eig(C);
        disp("P = "); disp(P);
        disp("lambda = "); disp(lambda);
    
        % alpha
        alpha = P\x; %inv(P)*x
    
        % 一般項
        fprintf("\n一般項：\n");
        
        if imag(lambda(1,1)) == 0 || imag(alpha(1)) == 0 ||imag(P(1,1)) == 0 ||imag(lambda(2,2)) == 0 ||imag(alpha(2)) == 0 ||imag(P(1,2)) == 0
            fprintf("               n                                           n  \n");
        else
            fprintf("                         n                                                                          n \n");
        end
        
        fprintf("xn = ( ");
        fukusosuu_hyoji(lambda(1,1));
        fprintf(" ) × ( ");
        fukusosuu_hyoji(alpha(1));
        fprintf(" ) × ( ");
        fukusosuu_hyoji(P(1,1));
        fprintf(" ) ＋ ( ");
        fukusosuu_hyoji(lambda(2,2));
        fprintf(" ) × ( ");
        fukusosuu_hyoji(alpha(2));
        fprintf(" ) × ( ");
        fukusosuu_hyoji(P(1,2));
        fprintf(" )");
        fprintf("\n\n\n");
    
        % 検算
        fprintf(" n       漸化式計算      一般項計算\n");
        for n = 0:10
           fprintf(" %2d %15.7g %15.7g\n", n, seq_n(n,c,x) ,lambda(1,1)^n * alpha(1) * P(1,1) + lambda(2,2)^n * alpha(2) * P(1,2));
        end
    case 'quit'
        disp('bye')

    otherwise
        disp('不正なコマンドです')
        m %再帰

end

% 正方行列のサイズを入力するとAをインプットして出力する
function A = input_A (input_size,str)

    if ne(strlength(str),1)
        fprintf("error: input size is not valid");
        return
    end

    fprintf("\n");

    % 2 * 2 の正方行列の入力
    if input_size == 2
        A = zeros(2);
        fprintf(" %s = ① ②\n     ③ ④\n",str);

    % 3 * 3 の正方行列の入力
    elseif input_size == 3
        A = zeros(3);
        fprintf(" %s = ① ② ③\n     ④ ⑤ ⑥\n     ⑦ ⑧ ⑨\n",str);
    
    % 4 * 4 の正方行列の入力
    elseif input_size == 4
        A = zeros(4);
        fprintf(" %s = ① ② ③ ④\n     ⑤ ⑥ ⑦ ⑧\n     ⑨ ⑩ ⑪ ⑫\n     ⑬ ⑭ ⑮ ⑯\n",str);
    
    else
        fprintf("正方行列のサイズは２か３か４にしか対応していません。\n\n");
        A = 'E';
        return
    end
    
    num = 1;

    for i=1 : input_size
        for p=1 : input_size
            fprintf("\n( %d )の数値を入力してください。",num);
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

% 縦向き一列の配列
function XA = input_XA (input_size,str)

    if ne(strlength(str),1)
        fprintf("error 234");
        return
    end

    fprintf("\n");

    % 2 列 
    if input_size == 2
        XA = zeros(2, 1);
        fprintf(" %s = ①\n     ②\n",str);
    
    % 3 列 
    elseif input_size == 3
        XA = zeros(3, 1);
        fprintf(" %s = ①\n     ②\n     ③\n",str);
    
    % 4 列 
    elseif input_size == 4
        XA = zeros(4, 1);
        fprintf(" %s = ①\n     ②\n     ③\n     ④\n",str);
    
    else
        fprintf("ベクトルの次元は２か３か４にしか対応していません。\n\n");
        XA = 'E';
        return
    end
    
    num = 1;

    for p=1 : input_size
        fprintf("\n( %d )の数値を入力してください",num);
        zeroni = input_repeat(0);
            if zeroni == 'E'
                XA = 'E';
                return
            end
        XA(p,1) = zeroni ;
        num = num + 1;
    end
end

% 横向き一行の配列
function XB = input_XB (input_size,str)

    if ne(strlength(str),1)
        fprintf("error 234");
        return
    end

    fprintf("\n");

    % 2 行 
    if input_size == 2
        XB = zeros(1, 2);
        fprintf(" %s = ① ②",str);

    % 3 行 
    elseif input_size == 3
        XB = zeros(1, 3);
        fprintf(" %s = ① ② ③",str);
    
    % 4 行 
    elseif input_size == 4
        XB = zeros(1, 4);
        fprintf(" %s = ① ② ③ ④",str);
    
    else
        fprintf("ベクトルの次元は２か３か４にしか対応していません。\n\n");
        XB = 'E';
        return
    end
   
    num = 1;

    for p=1 : input_size
        fprintf("\n( %d )の数値を入力してください",num);
        zeroni = input_repeat(0);
            if zeroni == 'E'
                XB = 'E';
                return
            end
        XB(1,p) = zeroni ;
        num = num + 1;
    end
end

% 掃き出し法
function X = Hakidashi(X,N)
    % N は 2 か 3
    
    Y = zeros(N);
    X = X * 0.00001 * 100000; % aの有効数字を揃える？

    for k = 1 : N
        l = k + 1;
        if k<N && round(X(k,k),5)==0
            v = 1; %d行目と%d行目を入れ替える
            itijikansuu_print(X,k,l,0,0,v,N);
            for m=1 : N+1
                Y(k,m)=X(k,m);
                X(k,m)=X(l,m);
                X(l,m)=Y(k,m);
            end
        end
        piv = X(k,k);
        if ne(round(X(k,k),5),0) && ne(round(X(k,k),5),1)
        v = 2; %d行目を%gで割わる
        itijikansuu_print(X,k,l,piv,0,v,N);
        for j=k : N+1
            X(k,j)=X(k,j)/piv;
        end
        end
        
        for i = 1: N
            if ne(i,k) && ne(round(X(i,k),4),0) && ne(round(X(k,k),4),0)
                if round(X(i,k),4)==1
                    v = 3; %d行目から%d行目を引く　1倍させないため
                    itijikansuu_print(X,k,l,piv,i,v,N);
                else
                    v = 4; %d行目から%g倍した%d行目を引く
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

%１次関数
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
                fprintf("\n　| %8.4G %8.4G | %8.4G |",ra(m,1),ra(m,2),ra(m,3));
            case 3
                fprintf("\n　| %8.4G %8.4G %8.4G | %8.4G |",ra(m,1),ra(m,2),ra(m,3),ra(m,4));
        end
        if k == m
            switch k
                case 1
                    switch v
                    case 1
                        fprintf("　%d行目と%d行目を入れ替える",k,l);            
                    case 2
                        fprintf("　%d行目を%gで割わる",k,round(piv,4));         
                    case 3
                        fprintf("　%d行目から%d行目を引く",i,k);
                    case 4
                        fprintf("　%d行目から%g倍した%d行目を引く",i,round(X(i,k),4),k);
                    end
                case 2
                    switch v
                    case 1
                        fprintf("　%d行目と%d行目を入れ替える",k,l);            
                    case 2
                        fprintf("　%d行目を%gで割わる",k,round(piv,4));         
                    case 3
                        fprintf("　%d行目から%d行目を引く",i,k);
                    case 4
                        fprintf("　%d行目から%g倍した%d行目を引く",i,round(X(i,k),4),k);
                    end
                case 3
                    switch v
                    case 1
                        fprintf("　%d行目と%d行目を入れ替える",k,l);            
                    case 2
                        fprintf("　%d行目を%gで割わる",k,round(piv,4));         
                    case 3
                        fprintf("　%d行目から%d行目を引く",i,k);
                    case 4
                        fprintf("　%d行目から%g倍した%d行目を引く",i,round(X(i,k),4),k);
                    end
            end
        end
    end
    fprintf("\n\n");
end

% 掃き出し法(ランク)
function X = Hakidashi_seihou(X,N)
    % N は 2 か 3
    
    Y = zeros(N);
    X = X * 0.00001 * 100000; % aの有効数字を揃える？（笑）

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
            v = 1; %d行目と%d行目を入れ替える
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
            v = 2; %d行目を%gで割わる
            RANK_hanbetu(X,k,l,piv,0,v,N);
            for j=k : N
                X(k,j)=X(k,j)/piv;
            end
        end
        
        for i = 1: N
            if ne(i,k) && ne(round(X(i,k),4),0) && ne(round(X(k,k),4),0)
                if round(X(i,k),4)==1
                    v = 3; %d行目から%d行目を引く　1倍させないため
                    RANK_hanbetu(X,k,l,piv,i,v,N);
                else
                    v = 4; %d行目から%g倍した%d行目を引く
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

% ランク
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
        fprintf("\n　| %8.4G %8.4G |",ra(m,1),ra(m,2));
            case 3
        fprintf("\n　| %8.4G %8.4G %8.4G |",ra(m,1),ra(m,2),ra(m,3));
        end
        if k == m
            switch k
                case 1
                    switch v
                    case 1
                        fprintf("　%d行目と%d行目を入れ替える",k,l);            
                    case 2
                        fprintf("　%d行目を%gで割わる",k,round(piv,4));         
                    case 3
                        fprintf("　%d行目から%d行目を引く",i,k);
                    case 4
                        fprintf("　%d行目から%g倍した%d行目を引く",i,round(X(i,k),4),k);
                    end
                case 2
                    switch v
                    case 1
                        fprintf("　%d行目と%d行目を入れ替える",k,l);            
                    case 2
                        fprintf("　%d行目を%gで割わる",k,round(piv,4));         
                    case 3
                        fprintf("　%d行目から%d行目を引く",i,k);
                    case 4
                        fprintf("　%d行目から%g倍した%d行目を引く",i,round(X(i,k),4),k);
                    end
                case 3
                    switch v
                    case 1
                        fprintf("　%d行目と%d行目を入れ替える",k,l);            
                    case 2
                        fprintf("　%d行目を%gで割わる",k,round(piv,4));         
                    case 3
                        fprintf("　%d行目から%d行目を引く",i,k);
                    case 4
                        fprintf("　%d行目から%g倍した%d行目を引く",i,round(X(i,k),4),k);
                    end
            end
        end
    end
    fprintf("\n\n");
end

% インプットして空白なら3回入れなおさせる
% 0:数字　1:文字
function input_num = input_repeat(n)
    if n == 0
        input_num = input ('＞　');
    else
        input_num = input ('＞　','s');
    end
    for yycounter = 3 : -1 : 1
        if isempty(input_num) == true
        fprintf("何か入れなきゃだめです！ あと%d回猶予があります。",yycounter);
        input_num = input('＞ ');
        end
    end
    if isempty(input_num) == true
         fprintf("やりなおします。");
         input_num = 'E';
         return;
    end
end

% FIXME: ランク落ちしているときの判別が網羅されていない可能性が高いです。
% 正方行列のランクを計算、解が存在するかどうかを出力する
function RANK_switch(seihou_X,X,N) 
    RANK = rank(seihou_X);
    [m,n] = size(seihou_X);
    if ne(m,n)
        fprintf("error RANK_switchには正方行列しか入力できない");
        return
    end
    switch N
        case 2
                if RANK == 0
                    fprintf("ランクは%dで解が存在しない。零行列です。\n",RANK);
                elseif ne(RANK,N)
                    if X(2,3)==0
                        fprintf("ランクは%dで,解が無数に存在する。\n",RANK);
                    else
                        fprintf("ランクは%dで、解が存在しない。\n",RANK);
                    end
                else
                    fprintf("ランクは%dで,唯一解が存在する。\n",RANK);
                end
        case 3
                if RANK == 0
                    fprintf("ランクは%dで解が存在しない。零行列です。\n",RANK);
                elseif ne(RANK,N)
                    if X(3,4)==0
                        fprintf("ランクは%dで,解が無数に存在する。\n",RANK);
                    else
                        fprintf("ランクは%dで、解が存在しない。\n",RANK);
                    end
                else
                    fprintf("ランクは%dで,唯一解が存在する。\n",RANK);
                end
    end
end

% 漸化式に基づく数列の第ｎ項計算 
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
    
% 実数部＋虚数部をいい感じで出力する 
function fukusosuu_hyoji(P)
    if imag(P) == 0
            fprintf("%6g",round(real(P),4));
    else
        if imag(P) < 0
            fprintf("%6g ー %6gi",round(real(P),4),round(imag(P)*(-1),4));
        else
            fprintf("%6g ＋ %6gi",round(real(P),4),round(imag(P),4));
        end
    end
end
