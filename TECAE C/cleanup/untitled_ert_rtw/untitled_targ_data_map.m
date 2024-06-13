    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 12;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (g0szqdi43g)
        ;%
            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% g0szqdi43g.DetectChange_vinit
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% g0szqdi43g.DetectChange_vinit_lok1bomoj3
                    section.data(1).logicalSrcIdx = 1;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(2) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% g0szqdi43g.CompareToConstant_const
                    section.data(1).logicalSrcIdx = 2;
                    section.data(1).dtTransOffset = 0;

                    ;% g0szqdi43g.CompareToConstant_co_pn14hizx3d
                    section.data(2).logicalSrcIdx = 3;
                    section.data(2).dtTransOffset = 1;

                    ;% g0szqdi43g.CompareToConstant_co_ns4fehihzh
                    section.data(3).logicalSrcIdx = 4;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            paramMap.sections(3) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% g0szqdi43g.CompareToConstant_co_ix3y3s2gey
                    section.data(1).logicalSrcIdx = 5;
                    section.data(1).dtTransOffset = 0;

                    ;% g0szqdi43g.CompareToConstant_co_c55hmjvzmj
                    section.data(2).logicalSrcIdx = 6;
                    section.data(2).dtTransOffset = 1;

                    ;% g0szqdi43g.CompareToConstant_co_jnwrtofzdu
                    section.data(3).logicalSrcIdx = 7;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            paramMap.sections(4) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% g0szqdi43g.CompareToConstant_co_b25dxkaim5
                    section.data(1).logicalSrcIdx = 8;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            paramMap.sections(5) = section;
            clear section

            section.nData     = 6;
            section.data(6)  = dumData; %prealloc

                    ;% g0szqdi43g.CompareToConstant_co_m0sl54ftov
                    section.data(1).logicalSrcIdx = 9;
                    section.data(1).dtTransOffset = 0;

                    ;% g0szqdi43g.CompareToConstant1_const
                    section.data(2).logicalSrcIdx = 10;
                    section.data(2).dtTransOffset = 1;

                    ;% g0szqdi43g.DetectChange1_vinit
                    section.data(3).logicalSrcIdx = 11;
                    section.data(3).dtTransOffset = 2;

                    ;% g0szqdi43g.DetectChange2_vinit
                    section.data(4).logicalSrcIdx = 12;
                    section.data(4).dtTransOffset = 3;

                    ;% g0szqdi43g.DetectChange_vinit_ppeky5ytmb
                    section.data(5).logicalSrcIdx = 13;
                    section.data(5).dtTransOffset = 4;

                    ;% g0szqdi43g.DetectChange1_vinit_cdfuotdr2t
                    section.data(6).logicalSrcIdx = 14;
                    section.data(6).dtTransOffset = 5;

            nTotData = nTotData + section.nData;
            paramMap.sections(6) = section;
            clear section

            section.nData     = 13;
            section.data(13)  = dumData; %prealloc

                    ;% g0szqdi43g.I2CControllerRead_SampleTime
                    section.data(1).logicalSrcIdx = 15;
                    section.data(1).dtTransOffset = 0;

                    ;% g0szqdi43g.Constant_Value
                    section.data(2).logicalSrcIdx = 16;
                    section.data(2).dtTransOffset = 1;

                    ;% g0szqdi43g.I2CControllerRead_Sa_d33x0whiz4
                    section.data(3).logicalSrcIdx = 17;
                    section.data(3).dtTransOffset = 2;

                    ;% g0szqdi43g.Constant1_Value
                    section.data(4).logicalSrcIdx = 18;
                    section.data(4).dtTransOffset = 3;

                    ;% g0szqdi43g.Constant_Value_n1gt4skuej
                    section.data(5).logicalSrcIdx = 19;
                    section.data(5).dtTransOffset = 4;

                    ;% g0szqdi43g.gyroBias_Y0
                    section.data(6).logicalSrcIdx = 20;
                    section.data(6).dtTransOffset = 5;

                    ;% g0szqdi43g.Constant_Value_h1jpjzo0yz
                    section.data(7).logicalSrcIdx = 21;
                    section.data(7).dtTransOffset = 6;

                    ;% g0szqdi43g.Gain_Gain
                    section.data(8).logicalSrcIdx = 22;
                    section.data(8).dtTransOffset = 7;

                    ;% g0szqdi43g.Constant7_Value
                    section.data(9).logicalSrcIdx = 23;
                    section.data(9).dtTransOffset = 8;

                    ;% g0szqdi43g.Constant6_Value
                    section.data(10).logicalSrcIdx = 24;
                    section.data(10).dtTransOffset = 9;

                    ;% g0szqdi43g.Constant5_Value
                    section.data(11).logicalSrcIdx = 25;
                    section.data(11).dtTransOffset = 10;

                    ;% g0szqdi43g.Constant4_Value
                    section.data(12).logicalSrcIdx = 26;
                    section.data(12).dtTransOffset = 11;

                    ;% g0szqdi43g.Merge1_InitialOutput
                    section.data(13).logicalSrcIdx = 27;
                    section.data(13).dtTransOffset = 12;

            nTotData = nTotData + section.nData;
            paramMap.sections(7) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% g0szqdi43g.Constant1_Value_ffc3pcccev
                    section.data(1).logicalSrcIdx = 28;
                    section.data(1).dtTransOffset = 0;

                    ;% g0szqdi43g.Constant3_Value
                    section.data(2).logicalSrcIdx = 29;
                    section.data(2).dtTransOffset = 1;

                    ;% g0szqdi43g.UnitDelay_InitialCondition
                    section.data(3).logicalSrcIdx = 30;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            paramMap.sections(8) = section;
            clear section

            section.nData     = 3;
            section.data(3)  = dumData; %prealloc

                    ;% g0szqdi43g.Constant2_Value
                    section.data(1).logicalSrcIdx = 31;
                    section.data(1).dtTransOffset = 0;

                    ;% g0szqdi43g.Constant_Value_nlnovbnqot
                    section.data(2).logicalSrcIdx = 32;
                    section.data(2).dtTransOffset = 1;

                    ;% g0szqdi43g.UnitDelay1_InitialCondition
                    section.data(3).logicalSrcIdx = 33;
                    section.data(3).dtTransOffset = 2;

            nTotData = nTotData + section.nData;
            paramMap.sections(9) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% g0szqdi43g.Constant1_Value_bsfweqpiy0
                    section.data(1).logicalSrcIdx = 34;
                    section.data(1).dtTransOffset = 0;

                    ;% g0szqdi43g.Constant_Value_avyvj4mo4b
                    section.data(2).logicalSrcIdx = 35;
                    section.data(2).dtTransOffset = 1;

                    ;% g0szqdi43g.Constant3_Value_dkx1fe5fvu
                    section.data(3).logicalSrcIdx = 36;
                    section.data(3).dtTransOffset = 2;

                    ;% g0szqdi43g.Constant2_Value_fad045x02c
                    section.data(4).logicalSrcIdx = 37;
                    section.data(4).dtTransOffset = 3;

                    ;% g0szqdi43g.Constant1_Value_pfphbi3aj2
                    section.data(5).logicalSrcIdx = 38;
                    section.data(5).dtTransOffset = 4;

                    ;% g0szqdi43g.Constant_Value_ffpsqzlbdy
                    section.data(6).logicalSrcIdx = 39;
                    section.data(6).dtTransOffset = 5;

                    ;% g0szqdi43g.Merge_InitialOutput
                    section.data(7).logicalSrcIdx = 40;
                    section.data(7).dtTransOffset = 6;

                    ;% g0szqdi43g.Constant_Value_husa0qpx1q
                    section.data(8).logicalSrcIdx = 41;
                    section.data(8).dtTransOffset = 7;

                    ;% g0szqdi43g.UnitDelay2_InitialCondition
                    section.data(9).logicalSrcIdx = 42;
                    section.data(9).dtTransOffset = 8;

            nTotData = nTotData + section.nData;
            paramMap.sections(10) = section;
            clear section

            section.nData     = 13;
            section.data(13)  = dumData; %prealloc

                    ;% g0szqdi43g.UnitDelay2_InitialCo_cdoo2qwebt
                    section.data(1).logicalSrcIdx = 43;
                    section.data(1).dtTransOffset = 0;

                    ;% g0szqdi43g.Constant1_Value_etpkr4nieu
                    section.data(2).logicalSrcIdx = 44;
                    section.data(2).dtTransOffset = 1;

                    ;% g0szqdi43g.Constant1_Value_ahosjj1nqv
                    section.data(3).logicalSrcIdx = 45;
                    section.data(3).dtTransOffset = 2;

                    ;% g0szqdi43g.Constant3_Value_dfptlknwpi
                    section.data(4).logicalSrcIdx = 46;
                    section.data(4).dtTransOffset = 3;

                    ;% g0szqdi43g.Constant2_Value_mav3u2ccum
                    section.data(5).logicalSrcIdx = 47;
                    section.data(5).dtTransOffset = 4;

                    ;% g0szqdi43g.Constant1_Value_kdkvzqxzai
                    section.data(6).logicalSrcIdx = 48;
                    section.data(6).dtTransOffset = 5;

                    ;% g0szqdi43g.Constant2_Value_ddvup1twb3
                    section.data(7).logicalSrcIdx = 49;
                    section.data(7).dtTransOffset = 6;

                    ;% g0szqdi43g.UnitDelay3_InitialCondition
                    section.data(8).logicalSrcIdx = 50;
                    section.data(8).dtTransOffset = 7;

                    ;% g0szqdi43g.UnitDelay_InitialCon_az4djt42al
                    section.data(9).logicalSrcIdx = 51;
                    section.data(9).dtTransOffset = 8;

                    ;% g0szqdi43g.Delay_InitialCondition
                    section.data(10).logicalSrcIdx = 52;
                    section.data(10).dtTransOffset = 9;

                    ;% g0szqdi43g.UnitDelay2_InitialCo_hvd4abdxew
                    section.data(11).logicalSrcIdx = 53;
                    section.data(11).dtTransOffset = 10;

                    ;% g0szqdi43g.UnitDelay_InitialCon_mjltlpvz4l
                    section.data(12).logicalSrcIdx = 54;
                    section.data(12).dtTransOffset = 11;

                    ;% g0szqdi43g.UnitDelay1_InitialCo_j4tad5ykz4
                    section.data(13).logicalSrcIdx = 55;
                    section.data(13).dtTransOffset = 12;

            nTotData = nTotData + section.nData;
            paramMap.sections(11) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% g0szqdi43g.Constant1_Value_kmhrd5ywb2
                    section.data(1).logicalSrcIdx = 56;
                    section.data(1).dtTransOffset = 0;

                    ;% g0szqdi43g.Constant2_Value_igvuwf4pod
                    section.data(2).logicalSrcIdx = 57;
                    section.data(2).dtTransOffset = 1;

                    ;% g0szqdi43g.UnitDelay_InitialCon_etldiagq10
                    section.data(3).logicalSrcIdx = 58;
                    section.data(3).dtTransOffset = 2;

                    ;% g0szqdi43g.UnitDelay1_InitialCo_dpy3sexlsr
                    section.data(4).logicalSrcIdx = 59;
                    section.data(4).dtTransOffset = 3;

                    ;% g0szqdi43g.UnitDelay2_InitialCo_imedlh53yo
                    section.data(5).logicalSrcIdx = 60;
                    section.data(5).dtTransOffset = 4;

                    ;% g0szqdi43g.Constant_Value_i4rpol133v
                    section.data(6).logicalSrcIdx = 61;
                    section.data(6).dtTransOffset = 5;

                    ;% g0szqdi43g.accelResoultion_Value
                    section.data(7).logicalSrcIdx = 62;
                    section.data(7).dtTransOffset = 6;

                    ;% g0szqdi43g.gyroResolution_Value
                    section.data(8).logicalSrcIdx = 63;
                    section.data(8).dtTransOffset = 7;

                    ;% g0szqdi43g.DLPF_level_Value
                    section.data(9).logicalSrcIdx = 64;
                    section.data(9).dtTransOffset = 8;

            nTotData = nTotData + section.nData;
            paramMap.sections(12) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 2;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (fsg2leehhck)
        ;%
            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% fsg2leehhck.nzv0ug4xex
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% fsg2leehhck.jnpzbqlsol
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 3;

                    ;% fsg2leehhck.eo03o30waq
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 4;

                    ;% fsg2leehhck.ks2ncqnu2u
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% fsg2leehhck.p324n3i0gf
                    section.data(1).logicalSrcIdx = 4;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            sigMap.sections(2) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 19;
        sectIdxOffset = 2;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (kywlqvr0ypq)
        ;%
            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% kywlqvr0ypq.gyv2crfp5t
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% kywlqvr0ypq.kzwxiyadzg
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section

            section.nData     = 5;
            section.data(5)  = dumData; %prealloc

                    ;% kywlqvr0ypq.h4mwrggmvb
                    section.data(1).logicalSrcIdx = 2;
                    section.data(1).dtTransOffset = 0;

                    ;% kywlqvr0ypq.nm5z3lxptv
                    section.data(2).logicalSrcIdx = 3;
                    section.data(2).dtTransOffset = 1;

                    ;% kywlqvr0ypq.hiyvgvcwwc
                    section.data(3).logicalSrcIdx = 4;
                    section.data(3).dtTransOffset = 2;

                    ;% kywlqvr0ypq.koj4hu2x3j
                    section.data(4).logicalSrcIdx = 5;
                    section.data(4).dtTransOffset = 3;

                    ;% kywlqvr0ypq.eskye0uorx
                    section.data(5).logicalSrcIdx = 6;
                    section.data(5).dtTransOffset = 4;

            nTotData = nTotData + section.nData;
            dworkMap.sections(2) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.b00ukyz5jy
                    section.data(1).logicalSrcIdx = 7;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(3) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% kywlqvr0ypq.iqstphf51w
                    section.data(1).logicalSrcIdx = 8;
                    section.data(1).dtTransOffset = 0;

                    ;% kywlqvr0ypq.h3p5eiwscu
                    section.data(2).logicalSrcIdx = 9;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(4) = section;
            clear section

            section.nData     = 2;
            section.data(2)  = dumData; %prealloc

                    ;% kywlqvr0ypq.b2fmnmxwcx.LoggedData
                    section.data(1).logicalSrcIdx = 10;
                    section.data(1).dtTransOffset = 0;

                    ;% kywlqvr0ypq.ep5uv4vl23.LoggedData
                    section.data(2).logicalSrcIdx = 11;
                    section.data(2).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            dworkMap.sections(5) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.o1nzhivyco
                    section.data(1).logicalSrcIdx = 12;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(6) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.knagm4mwnt
                    section.data(1).logicalSrcIdx = 13;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(7) = section;
            clear section

            section.nData     = 9;
            section.data(9)  = dumData; %prealloc

                    ;% kywlqvr0ypq.nqgctyjheo
                    section.data(1).logicalSrcIdx = 14;
                    section.data(1).dtTransOffset = 0;

                    ;% kywlqvr0ypq.kfyme04w51
                    section.data(2).logicalSrcIdx = 15;
                    section.data(2).dtTransOffset = 1;

                    ;% kywlqvr0ypq.e0n1zfkhyx
                    section.data(3).logicalSrcIdx = 16;
                    section.data(3).dtTransOffset = 2;

                    ;% kywlqvr0ypq.egccyhrq32
                    section.data(4).logicalSrcIdx = 17;
                    section.data(4).dtTransOffset = 3;

                    ;% kywlqvr0ypq.hjpsy2s451
                    section.data(5).logicalSrcIdx = 18;
                    section.data(5).dtTransOffset = 5;

                    ;% kywlqvr0ypq.aykatbjfy0
                    section.data(6).logicalSrcIdx = 19;
                    section.data(6).dtTransOffset = 6;

                    ;% kywlqvr0ypq.klz1hubbue
                    section.data(7).logicalSrcIdx = 20;
                    section.data(7).dtTransOffset = 8;

                    ;% kywlqvr0ypq.dbo4wvbch2
                    section.data(8).logicalSrcIdx = 21;
                    section.data(8).dtTransOffset = 9;

                    ;% kywlqvr0ypq.gkmodpii11
                    section.data(9).logicalSrcIdx = 22;
                    section.data(9).dtTransOffset = 10;

            nTotData = nTotData + section.nData;
            dworkMap.sections(8) = section;
            clear section

            section.nData     = 7;
            section.data(7)  = dumData; %prealloc

                    ;% kywlqvr0ypq.km55lhhfsp
                    section.data(1).logicalSrcIdx = 23;
                    section.data(1).dtTransOffset = 0;

                    ;% kywlqvr0ypq.dauka4rdav
                    section.data(2).logicalSrcIdx = 24;
                    section.data(2).dtTransOffset = 2;

                    ;% kywlqvr0ypq.haedsaifug
                    section.data(3).logicalSrcIdx = 25;
                    section.data(3).dtTransOffset = 3;

                    ;% kywlqvr0ypq.ivxia2ty2a
                    section.data(4).logicalSrcIdx = 26;
                    section.data(4).dtTransOffset = 4;

                    ;% kywlqvr0ypq.ck3goshkfc
                    section.data(5).logicalSrcIdx = 27;
                    section.data(5).dtTransOffset = 5;

                    ;% kywlqvr0ypq.eywg4nb5jo
                    section.data(6).logicalSrcIdx = 28;
                    section.data(6).dtTransOffset = 6;

                    ;% kywlqvr0ypq.azacaxp0eo
                    section.data(7).logicalSrcIdx = 29;
                    section.data(7).dtTransOffset = 7;

            nTotData = nTotData + section.nData;
            dworkMap.sections(9) = section;
            clear section

            section.nData     = 7;
            section.data(7)  = dumData; %prealloc

                    ;% kywlqvr0ypq.fp0hml1y33
                    section.data(1).logicalSrcIdx = 30;
                    section.data(1).dtTransOffset = 0;

                    ;% kywlqvr0ypq.m4hfmdpovj
                    section.data(2).logicalSrcIdx = 31;
                    section.data(2).dtTransOffset = 1;

                    ;% kywlqvr0ypq.nfkkjajx2a
                    section.data(3).logicalSrcIdx = 32;
                    section.data(3).dtTransOffset = 2;

                    ;% kywlqvr0ypq.aoiy4aroi3
                    section.data(4).logicalSrcIdx = 33;
                    section.data(4).dtTransOffset = 3;

                    ;% kywlqvr0ypq.algsaudzrt
                    section.data(5).logicalSrcIdx = 34;
                    section.data(5).dtTransOffset = 4;

                    ;% kywlqvr0ypq.bec0u3t1kq
                    section.data(6).logicalSrcIdx = 35;
                    section.data(6).dtTransOffset = 5;

                    ;% kywlqvr0ypq.kczfoezzo5
                    section.data(7).logicalSrcIdx = 36;
                    section.data(7).dtTransOffset = 6;

            nTotData = nTotData + section.nData;
            dworkMap.sections(10) = section;
            clear section

            section.nData     = 10;
            section.data(10)  = dumData; %prealloc

                    ;% kywlqvr0ypq.fbibrcbg4p
                    section.data(1).logicalSrcIdx = 37;
                    section.data(1).dtTransOffset = 0;

                    ;% kywlqvr0ypq.cxiaxnd521
                    section.data(2).logicalSrcIdx = 38;
                    section.data(2).dtTransOffset = 1;

                    ;% kywlqvr0ypq.lwezsfax15
                    section.data(3).logicalSrcIdx = 39;
                    section.data(3).dtTransOffset = 2;

                    ;% kywlqvr0ypq.dfw02mtjiv
                    section.data(4).logicalSrcIdx = 40;
                    section.data(4).dtTransOffset = 3;

                    ;% kywlqvr0ypq.ofsnvph1mh
                    section.data(5).logicalSrcIdx = 41;
                    section.data(5).dtTransOffset = 4;

                    ;% kywlqvr0ypq.cxh4loh0d3
                    section.data(6).logicalSrcIdx = 42;
                    section.data(6).dtTransOffset = 5;

                    ;% kywlqvr0ypq.dptcz4jthv
                    section.data(7).logicalSrcIdx = 43;
                    section.data(7).dtTransOffset = 6;

                    ;% kywlqvr0ypq.cyrjh01w41
                    section.data(8).logicalSrcIdx = 44;
                    section.data(8).dtTransOffset = 7;

                    ;% kywlqvr0ypq.mqro1bp25i
                    section.data(9).logicalSrcIdx = 45;
                    section.data(9).dtTransOffset = 8;

                    ;% kywlqvr0ypq.f02wb0ote1
                    section.data(10).logicalSrcIdx = 46;
                    section.data(10).dtTransOffset = 9;

            nTotData = nTotData + section.nData;
            dworkMap.sections(11) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.cdloafmsaf.ei3ocbja4n
                    section.data(1).logicalSrcIdx = 47;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(12) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.cztadea2uu.ei3ocbja4n
                    section.data(1).logicalSrcIdx = 48;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(13) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.akakd4xnt0.ei3ocbja4n
                    section.data(1).logicalSrcIdx = 49;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(14) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.cac4ptoedcs.ei3ocbja4n
                    section.data(1).logicalSrcIdx = 50;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(15) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.njo4mkrwxo.lhlgbedo2g
                    section.data(1).logicalSrcIdx = 51;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(16) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.egclr4anrs.lhlgbedo2g
                    section.data(1).logicalSrcIdx = 52;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(17) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.msrntjtgcx.lhlgbedo2g
                    section.data(1).logicalSrcIdx = 53;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(18) = section;
            clear section

            section.nData     = 1;
            section.data(1)  = dumData; %prealloc

                    ;% kywlqvr0ypq.bd5grctbpll.lhlgbedo2g
                    section.data(1).logicalSrcIdx = 54;
                    section.data(1).dtTransOffset = 0;

            nTotData = nTotData + section.nData;
            dworkMap.sections(19) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 4232229215;
    targMap.checksum1 = 3568059544;
    targMap.checksum2 = 4230714867;
    targMap.checksum3 = 868094012;

