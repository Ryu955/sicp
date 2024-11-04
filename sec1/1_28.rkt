#lang sicp
; だまされないFermatテストの変形の一つはMiller-Rabin テスト (Miller-Rabin test) (Miller 1976; Rabin 1980)という.
; これは, nが素数であり, aをnより小さい任意の正の整数とすると, aの(n - 1)乗はn を法として1と合同であるという, Fermatの小定理のもう一つの方から始める.
; Miller-Rabinテストで数nの素数性をテストするには, a < nをランダムにとり, expmod手続きを使ってnを法としたaの(n - 1)乗を作る.
; しかし, expmodで二乗を計算しながら「nを法とした1の自明でない平方根」, つまり1でもn - 1でもないがその二乗がnを法として1になる数がなかったか調べる.
; そういう, nを法とした1の自明でない平方根があればnが素数でないことは証明出来る.
; またnが素数でない奇数なら, a < nの少なくても半分はan-1を計算する時, nを法とした1の自明でない平方根が出てくることも証明出来る.
; (これがMiller-Rabinテストがだまされない理由である.)
; nを法とした1の自明でない平方根を見つけたらシグナルを出すようにexpmod手続きを修正せよ.
; これを使いfermat-testに似たMiller-Rabinテストの手続きを実装せよ. 分っている素数, 非素数をテストし, 手続きを検査せよ.
; ヒント: expmodにシグナルを出させる方法の一つは0を返させることである.

; memo: Fermatの小定理
; a^n ≡ a (mod n)
; もうひとつのFermatの小定理
; a^n-1 ≡ 1 (mod n)
; nは素数、 aは0 < a < n

; memo: 「nを法とした1の自明でない平方根」
; 1でもn - 1でもないがその二乗がnを法として1になる数がなかったか調べる

; とりあえず、使う側だけ定義
(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

; いつもの
(define (square x) (* x x))

; こいつを変える必要がありそう
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

; 二乗が1になるが、それ自体は1でも  n - 1  でもない
(define (check-sqrt? x n)
  (cond ((= x 1) #f)
        ((= x (- n 1)) #f)
        (else #t)))

(miller-rabin-test 1105)
; -> #t


