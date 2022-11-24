//
//  NotificationWidget.swift
//  NotificationWidget
//
//  Created by Rodrigo Mendez on 23/11/22.
//

import WidgetKit
import SwiftUI
import ActivityKit



@main
struct NotificationWidgets: WidgetBundle {
    var body: some Widget {

        if #available(iOS 16.1, *) {
          WidgetNotification()
        }
    }
}

struct LockScreenView: View {
  let context: ActivityViewContext<NotificationAttributes>
    var body: some View {
      VStack(alignment: .center) {
        ContentView(context: context)
        ActionButtontView()
      }.padding()
    }
}

struct ContentView: View {
  let context: ActivityViewContext<NotificationAttributes>
    var body: some View {
      VStack(alignment: .center) {
        Text(context.attributes.title)
          .foregroundColor(.white)
        Text(context.state.mesage)
          .foregroundColor(.white)
      }
    }
}

struct IconPlayView: View {
  var body: some View {
      HStack {
          Image(systemName: "play.square")
              .foregroundColor(.white)
      }
  }
}


struct IconCloseView: View {
  var body: some View {
      HStack(alignment: .center) {
          Image(systemName: "xmark.circle")
              .foregroundColor(.white)
      }
  }
}

struct IconNotifiyView: View {
  var body: some View {
      HStack(alignment: .center) {
          Image(systemName: "bell.badge")
              .foregroundColor(.white)
      }
  }
}

struct ActionButtontView: View {
  var body: some View {
    HStack{
      Button(action: {}) {
          HStack {
              Image(systemName: "play.square")
                  .foregroundColor(.white)
            Text("Subscríbete").font(.caption)
              .bold()
          }
          .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 10))
          .background(.green)
          .clipShape(Capsule())
          .foregroundColor(.white)
      }
      Button(action: {}) {
          HStack {
              Image(systemName: "bell.badge")
                  .foregroundColor(.white)
            Text("Notificacion").font(.caption)
              .bold()
          }
          .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 10))
          .background(.red)
          .clipShape(Capsule())
          .foregroundColor(.white)
      }
    }
  }
}

struct WidgetNotification: Widget {

    var body: some WidgetConfiguration {
      ActivityConfiguration(for: NotificationAttributes.self) { context in
        // Aquí creamos la apariencia en la pantalla de bloqueo
        // Crea el banner, podemos cambiar
        LockScreenView(context: context)
      } dynamicIsland: { context in
        // Se crea la vista que aparece en la isla dinámica
        DynamicIsland {
          // Crea la vista expandida
          DynamicIslandExpandedRegion(.leading) {
         
          }
          
          DynamicIslandExpandedRegion(.trailing) {
            IconCloseView()
          }
          
          DynamicIslandExpandedRegion(.center) {
            ContentView(context: context)
          }
          
          DynamicIslandExpandedRegion(.bottom) {
            ActionButtontView()
          }
        } compactLeading: {
          // Este es el icono del lado izquierdo
          IconPlayView()
        } compactTrailing: {
          // Este es el icono del lado derecho
          IconNotifiyView()
        } minimal: {
          // Crea la vista minmalista
          IconPlayView()
        }
        .keylineTint(.yellow)
      }
    }
}

struct WidgetNotification_Previews: PreviewProvider {
    static var previews: some View {
      IconPlayView()
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
