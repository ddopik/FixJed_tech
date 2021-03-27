package com.example.flutter_base_app

import androidx.annotation.NonNull
import com.zendesk.service.ErrorResponse
import com.zendesk.service.ZendeskCallback
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import zendesk.chat.*
import zendesk.messaging.MessagingActivity


class MainActivity : FlutterActivity() {


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "samples.ashtar.dev/zendesk")
                .setMethodCallHandler { call, result ->
                    // Note: this method is invoked on the main thread.
//                    val name: String = call.argument("userName")!!
//                    val email: String = call.argument("email")!!
//                    val profileProvider: ProfileProvider = Chat.INSTANCE.providers()?.profileProvider()!!
//                    val visitorInfo: VisitorInfo = VisitorInfo.builder()
//                            .withEmail(email)
//                            .withName(name)
//                            .build()
//                    val setVisitorInfoCallback = object : ZendeskCallback<Void>() {
//
//                        override fun onSuccess(p0: Void?) {
//                            TODO("Not yet implemented")
//                        }
//
//                        override fun onError(p0: ErrorResponse?) {
//                            TODO("Not yet implemented")
//                        }
//                    }
//                    profileProvider.setVisitorInfo(visitorInfo, setVisitorInfoCallback)
//
//                    val setDepartmentCallback = object : ZendeskCallback<Void>() {
//
//                        override fun onSuccess(p0: Void?) {
//                            TODO("Not yet implemented")
//                        }
//
//                        override fun onError(p0: ErrorResponse?) {
//                            TODO("Not yet implemented")
//                        }
//                    }
//                    val chatProvider: ChatProvider = Chat.INSTANCE.providers()!!.chatProvider()
//                    chatProvider.setDepartment("Support", setDepartmentCallback)
//                    val chatConfiguration: ChatConfiguration = ChatConfiguration.builder()
//                            .withPreChatFormEnabled(false)
//                            .withOfflineFormEnabled(false)
//                            .withAgentAvailabilityEnabled(false)
//                            .build()
//                    MessagingActivity.builder()
//                            .withEngines(ChatEngine.engine())
//                            .show(this, chatConfiguration)
//                    result.success(null)
                }

    }
}
