modalPresentStyle != .fullScreen 이면
Life Cycle은 PresentedViewController에만 적용
따로 적용을 해줘야한다 
            //firstViewCon.beginAppearanceTransition(true, animated: true) -> isAppearing == true 나타날 ViewCon
            //presentViewCon.childViewCon.beginAppearanceTransition(false, animated: true) -> isAppearing == false 사라질 ViewCon
            
Navigation Controller,Tabbar Controller는 LifeCycle이 적용된다.
func animationEnded(_ transitionCompleted: Bool) -> 두번 일어나는 issue는 아직 모르겠다.
