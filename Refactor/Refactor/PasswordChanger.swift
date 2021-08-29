import Foundation

protocol PasswordChanging {
    func change(securityToken: String,
                oldPassword: String,
                newPassword: String,
                onSuccess: @escaping () -> Void,
                onFailure: @escaping (String) -> Void)
}

final class PasswordChanger: PasswordChanging {
    private static var pretendToSucceed = false
    private var successOrFailureTimer: SuccessOrFailureTimer?
    
    func change(securityToken: String,
                oldPassword: String,
                newPassword: String,
                onSuccess: @escaping () -> Void,
                onFailure: @escaping (String) -> Void) {
        
        print("Initiate change password:")
        print("security token: \(securityToken)")
        print("old password:\(oldPassword)")
        print("new password: \(newPassword)")
        
        successOrFailureTimer = SuccessOrFailureTimer(onSuccess: onSuccess,
                                                      onFailure: onFailure,
                                                      timer: Timer.scheduledTimer(
                                                        withTimeInterval: 1,
                                                        repeats: false
                                                      ) { [weak self] _ in self?.callSuccessOrFailure() }
        )
        
    }
    
    private func callSuccessOrFailure() {
        if PasswordChanger.pretendToSucceed {
            successOrFailureTimer?.onSuccess()
        } else {
            successOrFailureTimer?.onFailure("Sorry,something went wrong.")
        }
        PasswordChanger.pretendToSucceed.toggle()
        successOrFailureTimer?.timer.invalidate()
        successOrFailureTimer = nil
    }
    
}

private struct SuccessOrFailureTimer {
    let onSuccess: () -> Void
    let onFailure: (String) -> Void
    let timer: Timer
}
