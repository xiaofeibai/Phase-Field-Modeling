if( ELASTIC )
    CalculateStrain;
    
    f1_elastic = (- 2.*C11.*Q11 - 4.*C12.*Q12).*TotalStrain_FilmRef_11.*P1_FilmRef + (- 2.*C11.*Q12 - 2.*C12.*Q11 - 2.*C12.*Q12).*TotalStrain_FilmRef_22.*P1_FilmRef + (- 2.*C11.*Q12 - 2.*C12.*Q11 - 2.*C12.*Q12).*TotalStrain_FilmRef_33.*P1_FilmRef + (-4.*C44.*Q44).*TotalStrain_FilmRef_12.*P2_FilmRef + (-4.*C44.*Q44).*TotalStrain_FilmRef_13.*P3_FilmRef + (2.*C11.*Q11.^2 + 4.*C11.*Q12.^2 + 4.*C12.*Q12.^2 + 8.*C12.*Q11.*Q12).*P1_FilmRef.^3 + (2.*C11.*Q12.^2 + 2.*C12.*Q11.^2 + 6.*C12.*Q12.^2 + 4.*C44.*Q44.^2 + 4.*C11.*Q11.*Q12 + 4.*C12.*Q11.*Q12).*P1_FilmRef.*P2_FilmRef.^2 + (2.*C11.*Q12.^2 + 2.*C12.*Q11.^2 + 6.*C12.*Q12.^2 + 4.*C44.*Q44.^2 + 4.*C11.*Q11.*Q12 + 4.*C12.*Q11.*Q12).*P1_FilmRef.*P3_FilmRef.^2;
    f2_elastic = (- 2.*C11.*Q12 - 2.*C12.*Q11 - 2.*C12.*Q12).*TotalStrain_FilmRef_11.*P2_FilmRef + (- C11.*Q11 - C11.*Q12 - C12.*Q11 - 3.*C12.*Q12 - 2.*C44.*Q44).*TotalStrain_FilmRef_22.*P2_FilmRef + (2.*C44.*Q44 - C11.*Q12 - C12.*Q11 - 3.*C12.*Q12 - C11.*Q11).*TotalStrain_FilmRef_33.*P2_FilmRef + (-4.*C44.*Q44).*TotalStrain_FilmRef_12.*P1_FilmRef + (2.*C11.*Q12 - 2.*C11.*Q11 + 2.*C12.*Q11 - 2.*C12.*Q12).*TotalStrain_FilmRef_23.*P3_FilmRef + (2.*C11.*Q12.^2 + 2.*C12.*Q11.^2 + 6.*C12.*Q12.^2 + 4.*C44.*Q44.^2 + 4.*C11.*Q11.*Q12 + 4.*C12.*Q11.*Q12).*P1_FilmRef.^2.*P2_FilmRef + (C11.*Q11.^2 + 3.*C11.*Q12.^2 + C12.*Q11.^2 + 5.*C12.*Q12.^2 + 2.*C44.*Q44.^2 + 2.*C11.*Q11.*Q12 + 6.*C12.*Q11.*Q12).*P2_FilmRef.^3 + (3.*C11.*Q11.^2 + 5.*C11.*Q12.^2 - C12.*Q11.^2 + 3.*C12.*Q12.^2 - 2.*C44.*Q44.^2 - 2.*C11.*Q11.*Q12 + 10.*C12.*Q11.*Q12).*P2_FilmRef.*P3_FilmRef.^2;
    f3_elastic = (- 2.*C11.*Q12 - 2.*C12.*Q11 - 2.*C12.*Q12).*TotalStrain_FilmRef_11.*P3_FilmRef + (2.*C44.*Q44 - C11.*Q12 - C12.*Q11 - 3.*C12.*Q12 - C11.*Q11).*TotalStrain_FilmRef_22.*P3_FilmRef + (- C11.*Q11 - C11.*Q12 - C12.*Q11 - 3.*C12.*Q12 - 2.*C44.*Q44).*TotalStrain_FilmRef_33.*P3_FilmRef + (-4.*C44.*Q44).*TotalStrain_FilmRef_13.*P1_FilmRef + (2.*C11.*Q12 - 2.*C11.*Q11 + 2.*C12.*Q11 - 2.*C12.*Q12).*TotalStrain_FilmRef_23.*P2_FilmRef + (2.*C11.*Q12.^2 + 2.*C12.*Q11.^2 + 6.*C12.*Q12.^2 + 4.*C44.*Q44.^2 + 4.*C11.*Q11.*Q12 + 4.*C12.*Q11.*Q12).*P1_FilmRef.^2.*P3_FilmRef + (3.*C11.*Q11.^2 + 5.*C11.*Q12.^2 - C12.*Q11.^2 + 3.*C12.*Q12.^2 - 2.*C44.*Q44.^2 - 2.*C11.*Q11.*Q12 + 10.*C12.*Q11.*Q12).*P2_FilmRef.^2.*P3_FilmRef + (C11.*Q11.^2 + 3.*C11.*Q12.^2 + C12.*Q11.^2 + 5.*C12.*Q12.^2 + 2.*C44.*Q44.^2 + 2.*C11.*Q11.*Q12 + 6.*C12.*Q11.*Q12).*P3_FilmRef.^3;

    f1_elastic = f1_elastic .* in_film .* Nucleation_Sites;
    f2_elastic = f2_elastic .* in_film .* Nucleation_Sites;
    f3_elastic = f3_elastic .* in_film .* Nucleation_Sites;

    f1_elastic_2Dk = fft_2d_slices(f1_elastic);
    f2_elastic_2Dk = fft_2d_slices(f2_elastic);
    f3_elastic_2Dk = fft_2d_slices(f3_elastic);
else
    f1_elastic_2Dk = 0; f2_elastic_2Dk = 0; f3_elastic_2Dk = 0;
    f1_elastic = 0; f2_elastic = 0; f3_elastic = 0;
    TotalStrain_FilmRef_11 = 0; TotalStrain_FilmRef_22 = 0; 
    TotalStrain_FilmRef_33 = 0; TotalStrain_FilmRef_12 = 0; 
    TotalStrain_FilmRef_13 = 0; TotalStrain_FilmRef_23 = 0;
    u_FilmRef_1 = 0; u_FilmRef_2 = 0; u_FilmRef_3 = 0;
end