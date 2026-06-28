# widget-api

Chaque widget expose une seule fonction publique (pf_widget_xxx_render)
et peut utiliser autant de helpers privés (_pf_widget_xxx_*) que nécessaire.
La construction de l'affichage doit être isolée
dans _pf_widget_xxx_build_output()
lorsque la complexité le justifie.

Décision prise dans le cadre de la phase Foundation (v0.1.0-alpha). Toute remise en cause de cette décision devra faire l'objet d'un nouvel ADR.
