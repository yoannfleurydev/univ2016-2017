package fiche5.mvc;

import fiche5.util.ChangeState;
import fiche5.util.Observable;

public aspect RainbowConfig {
    declare precedence : RainbowConfig, ModelDependency, ApplicationConfigurator;

    declare @type : RainbowModel : @Observable;
    declare @method : (* fiche5.business.RainbowModel.changeColor(..)) : @ChangeState;
}
