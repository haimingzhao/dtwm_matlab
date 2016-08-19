% Copyright (C) 2013 Quan Wang <wangq10@rpi.edu>,
% Signal Analysis and Machine Perception Laboratory,
% Department of Electrical, Computer, and Systems Engineering,
% Rensselaer Polytechnic Institute, Troy, NY 12180, USA

% this is a demo showing the use of our dynamic time warping package 
% we provide both Matlab version and C/MEX version
% the C/MEX version is much faster and highly recommended


clear;clc;
close all;

% mex dtw_c.c;

% a=rand(100,1);
% b=rand(120,1);
a = [ 
589
561
640
656
727
697
640
599
568
577
553
582
600
566
653
673
742
716
660
617
583
587
565
598
628
618
688
705
770
736
678
639
604
611
594
634
658
622
709
722
782
756
702
653
615
621
602
635
677
635
736
755
811
798
735
697
661
667
645
688
713
667
762
784
837
817
767
722
681
687
660
698
717
696
775
796
858
826
783
740
701
706
677
711
734
690
785
805
871
845
801
764
725
723
690
734
750
707
807
824
886
859
819
783
740
747
711
751
804
756
860
878
942
913
869
834
790
800
763
800
826
799
890
900
961
935
894
855
809
810
766
805
821
773
883
898
957
924
881
837
784
791
760
802
828
778
889
902
969
947
908
867
815
812
773
813
834
782
892
903
966
937
896
858
817
827
797
843
];

b = [
589
561
640
656
727
697
640
599
568
577
553
582
600
566
653
673
742
716
660
617
583
587
565
598
628
618
688
705
770
736
678
639
604
611
594
634
658
622
709
722
782
756
702
653
615
621
602
635
677
635
736
755
811
798
735
697
661
667
645
688
713
667
762
784
837
817
767
722
681
687
660
698
717
696
775
796
858
826
783
740
701
706
677
711
734
690
785
805
871
845
801
764
725
723
690
734
750
707
807
824
886
859
819
783
740
747
711
751
804
756
860
878
942
913
869
834
790
800
763
800
826
799
890
900
961
935
894
855
809
810
766
805
821
773
883
898
957
924
881
837
784
791
760
802
828
778
889
902
969
947
908
867
815
812
773
813
834
782
892
903
966
937
896
858
817
827
797
843
];


% [d1, d2, L, R, P, OP]= test_dtwm(a(1:160), b(1:160), 0.2, 10, 20);
[d1, d2, L, R, P, OP]= test_dtwm(a(1:160), b(1:160), 50, 10, 20);
% testall(a,b);
